# Build Package
# -------------
#
# Author: Henrik Nørfjand Stengaard
# Date:   2017-01-02
#
# A PowerShell script to build package for HstWB Installer.


Add-Type -Assembly System.IO.Compression.FileSystem


$compressionLevel = [System.IO.Compression.CompressionLevel]::Optimal
$rootDir = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath("..")
$packageDir = [System.IO.Path]::Combine($rootDir, "package")


# c# code for forward slash encoder used to create zip files with forward slash as path separator in entries compatible with amiga
$source = @"
using System.Text;

namespace HstWB.Package
{ 
	public class ForwardSlashEncoder : UTF8Encoding
	{
		public ForwardSlashEncoder() : base(true)
		{
		}

		public override byte[] GetBytes(string s)
		{
			s = s.Replace("\\", "/");
			return base.GetBytes(s);
		}
	}
}
"@
Add-Type -TypeDefinition $source -Language CSharp 


# create instance of forward slash encoder
$forwardSlashEncoder = New-Object 'HstWB.Package.ForwardSlashEncoder'


# read package ini lines
$packageIniFile = [System.IO.Path]::Combine($packageDir, 'package.ini')
$packageIniLines = Get-Content $packageIniFile


# get package name and version from package ini lines
$packageName = ($packageIniLines | Where-Object { $_ -match '^Name' } | Select-Object -First 1) -replace '^Name=', ''
$packageVersion = ($packageIniLines | Where-Object { $_ -match '^Version' } | Select-Object -First 1) -replace '^Version=', ''


# write progress message
Write-Host "Build package '$packageName' v$packageVersion"


# compress content directories to zip files
$contentDirs = Get-ChildItem -Path $rootDir | Where-Object { $_.PSIsContainer -and $_.Name -notmatch '(package|tools|licenses)' }
foreach ($contentDir in $contentDirs)
{
	# write progress message
	Write-Host ("Compressing content '" + $contentDir.Name + "' zip file...")

	# content zip file
	$contentZipFile = [System.IO.Path]::Combine($packageDir, ($contentDir.Name + ".zip"))

	# delete content zip file, if it exists
	if (test-path -path $contentZipFile)
	{
		remove-item $contentZipFile -force
	}

	# compress content directory
	[System.IO.Compression.ZipFile]::CreateFromDirectory($contentDir.FullName, $contentZipFile, $compressionLevel, $false, $forwardSlashEncoder)	
}


# write progress message
Write-Host "Compressing package zip file..."

# package file
$packageFile = "{0}\{1}.{2}.zip" -f $rootDir, ($packageName -replace '\s', '.'), $packageVersion

# delete package file, if it exists
if (test-path -path $packageFile)
{
	remove-item $packageFile -force
}

# compress package directory
[System.IO.Compression.ZipFile]::CreateFromDirectory($packageDir, $packageFile, $compressionLevel, $false, $forwardSlashEncoder)


# write progress message
Write-Host "Done."
