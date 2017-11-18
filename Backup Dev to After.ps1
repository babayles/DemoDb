Push-Location; Import-Module sqlps -DisableNameChecking; Pop-Location

$serverPath = "SQLSERVER:\SQL\localhost\Default"
$databaseName = "Demo"
$backupTo = join-path (Get-Location) "$databaseName-after.bak"
Backup-SqlDatabase -Path $serverPath  -Database $databaseName  -BackupFile $backupTo
