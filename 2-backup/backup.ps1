
param(
    [string] $path = './app',
    [string] $destinationPath = './',
    [switch] $isWebApp
)

if (-not (test-path $path)) {
    throw "Path $path does not exist"
}

if ($isWebApp -eq $true) {
    try {
        $containsAppFiles = "$((get-childitem $Path).Extension | sort-object -unique)" -match  '\.js|\.html|\.css'

        if (-not $containsAppFiles) {
            throw "Not a web app"
        } else {
            write-host "Source files look good, continuing"
        }
    } catch {
        throw "No backup created due to: $($_.Exception.Message)"
    }
}

$date = get-date -format "yyyy-MM-dd"
$destinationFileName = "$($destinationPath + 'backup-' + $date)"

if (-not (test-path "$destinationFileName.zip")) {
    compress-archive -path $path -compressionlevel 'fastest' -destinationpath $destinationFileName
    write-host "Backup completed at $destinationFileName.zip"
} else {
    write-error "Today's backup already exists"
}