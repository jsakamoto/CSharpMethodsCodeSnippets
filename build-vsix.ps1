# move current folder to where contains this .ps1 script file.
$scriptDir = Split-Path $MyInvocation.MyCommand.Path
pushd $scriptDir
[System.Reflection.Assembly]::LoadFile((Convert-Path "Ionic.Zip.dll")) > $null

# Get version infomation from reading manifest file.
$manifest = [xml](cat .\extension.vsixmanifest -Raw)
$ver = $manifest.PackageManifest.Metadata.Identity.Version

# Create .vsix a package with embedding version information.
$zip = new-object Ionic.Zip.ZipFile
$zip.AddFile((Convert-Path '.\`[Content_Types`].xml'), "") > $null
$zip.AddFile((Convert-Path .\extension.vsixmanifest), "") > $null
$zip.AddFile((Convert-Path .\icon.png), "") > $null
$zip.AddFile((Convert-Path .\registry.pkgdef), "") > $null
$zip.AddDirectory((Convert-Path .\csharp), "csharp") > $null
$zip.Save((Join-Path $scriptDir "CSharpMethodCodeSnippets.$ver.vsix"))
#DEBUG: $zip.Save((Join-Path $scriptDir "CSharpMethodCodeSnippets.zip"))
$zip.Dispose()
