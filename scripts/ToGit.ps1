<#
Script to do a push - suitable for calling from LogOff script events or similar
#>
$outputFile = [Environment]::GetFolderPath("MyDocuments") + "\ToGit.out"
$startDate = Get-Date
$str = "GitBackup Start: "  + $startDate
$str | out-file -Append -FilePath $OutputFile

$server="localhost"

$User = "Administrator"
$PWord = ConvertTo-SecureString -String "changeme123456" -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, $PWord

$Uri = "http://cwatson1l2:8080/Thingworx/Things/PTC.DevOps.GitPushScheduler/Services/CommitAllGitProjects"
echo $Uri
Invoke-RestMethod -Method Post -Credential $Credential -ContentType application/json -Uri $Uri

$endDate = Get-Date
$str = "GitBackup End: "  + $endDate
$str | out-file -Append -FilePath $OutputFile
