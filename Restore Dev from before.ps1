Push-Location; Import-Module sqlps -DisableNameChecking; Pop-Location

$serverPath = "SQLSERVER:\SQL\localhost\Default"
$databaseName = "Demo"
$restoreFrom = join-path (Get-Location) "$databaseName-before.bak"

$databasePath = join-path $serverPath "Databases\$databaseName"
if(Test-Path $databasePath)
{
        Invoke-SqlCmd "USE [master]; ALTER DATABASE [$databaseName] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE; DROP DATABASE [$databaseName]"
}

Restore-SqlDatabase -Path $serverPath -Database $databaseName -BackupFile $restoreFrom
