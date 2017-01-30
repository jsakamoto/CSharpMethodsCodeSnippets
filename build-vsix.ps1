# move current folder to where contains this .ps1 script file.
$scriptDir = Split-Path $MyInvocation.MyCommand.Path
pushd $scriptDir
$scriptDir = (pwd).Path
[System.Reflection.Assembly]::LoadFile((Convert-Path "buildTools\Ionic.Zip.dll")) > $null

if( -not (Test-Path "dist")) { md "dist" > $null }
if( -not (Test-Path "obj")) { md "obj" > $null }

# Get version infomation from reading manifest file.
echo "Retrieving information from manifest file..."
$manifest = [xml](cat .\src\extension.vsixmanifest -Raw)
$ver = $manifest.PackageManifest.Metadata.Identity.Version
$packageId = $manifest.PackageManifest.Metadata.Identity.id
$displayName = $manifest.PackageManifest.Metadata.DisplayName
$description = $manifest.PackageManifest.Metadata.Description.'#text'
$extensionDir = "[installdir]\Common7\IDE\Extensions\xvym1vt4.4m0"
$vsixFileName = "CSharpMethodsCodeSnippets"
$language = "en-US"

# Create "manifest.json".
echo "Creating `"manifest.json`"..."
$baseDir = (pwd).Path
$srcFiles = @(ls (Join-Path $baseDir "src\*.*") -Recurse -File | where Name -ne "[Content_Types].xml" |  % { $_.FullName })
$files = $srcFiles | % {
  @{
    sha256 = (Get-FileHash $_ -Algorithm SHA256).Hash;
    fileName = $_.Substring($baseDir.Length).Replace("\","/");
  }
}

$manifestJson = [ordered]@{
    id = $packageId;
    version = $ver;
    type =  "Vsix";
    language = $language;
    vsixId = $packageId;
    extensionDir = $extensionDir;
    files = $files;
    dependencies = @{
        "Microsoft.VisualStudio.Component.CoreEditor" = "[11.0,16.0)";
    }
}
$manifestJson | ConvertTo-Json -Compress | Out-File "obj\manifest.json" -Encoding utf8

# Create "catalog.json"
echo "Creating `"catalog.json`"..."
$catalogJson = [ordered]@{
    manifestVersion = "1.1";
    info = [ordered]@{
        id = "$packageId,version=$ver,language=$language";
    };
    packages= @(
        [ordered]@{
            id = "Component.$packageId";
            version = $ver;
            type =  "Component";
            language = $language;
            extension =  $true;
            dependencies = @{
                "$packageId" = [ordered]@{
                    version =  "[$ver]";
                    language = $language;
                };
                "Microsoft.VisualStudio.Component.CoreEditor" = "[11.0,16.0)";
            };
            localizedResources = @(
                [ordered]@{
                    language = $language;
                    title = $displayName;
                    description = $description;
                }
            );
        },
        [ordered]@{
            id = $packageId;
            version = $ver;
            type = "Vsix";
            language = $language;
            payloads = @(
                [ordered]@{
                    fileName = "$vsixFileName.vsix";
                    #size = ?;
                }
            );
            vsixId = $packageId;
            extensionDir = $extensionDir;
        }
    );
}
$catalogJson | ConvertTo-Json -Depth 100 -Compress | Out-File "obj\catalog.json" -Encoding utf8


# Create .vsix a package with embedding version information.
echo "Zipping to .VSIX file..."
$zip = new-object Ionic.Zip.ZipFile
$zip.AddFile((Convert-Path '.\src\`[Content_Types`].xml'), "") > $null
$zip.AddFile((Convert-Path .\src\extension.vsixmanifest), "") > $null
$zip.AddFile((Convert-Path .\src\icon.png), "") > $null
$zip.AddFile((Convert-Path .\src\registry.pkgdef), "") > $null
#$zip.AddFile((Convert-Path .\release-notes.txt), "") > $null
$zip.AddDirectory((Convert-Path .\src\csharp), "csharp") > $null
$zip.AddFile((Convert-Path .\obj\manifest.json), "") > $null
$zip.AddFile((Convert-Path .\obj\catalog.json), "") > $null

$zip.Save((Join-Path $scriptDir "dist\$vsixFileName.$ver.vsix"))
#DEBUG: 
$zip.Save((Join-Path $scriptDir "dist\DEBUG.zip"))
$zip.Dispose()

echo "$vsixFileName.$ver.vsix - Build complete."
echo ("The .vsix file is in `"{0}`"." -f (Join-Path $scriptDir "dist"))