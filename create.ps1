############################################
# HelloID-Conn-Prov-Target-GoodHabitz-Create
# PowerShell V2
############################################

try {
    if ($actionContext.DryRun -eq $true) {
        Write-Information "[DryRun] correlate GoodHabitz account for: [$($personContext.Person.DisplayName)], will be executed during enforcement"
        $outputContext.AccountReference = $actionContext.Data.EmailAddress
        $outputContext.success = $true
    }

    if (-not($actionContext.DryRun -eq $true)) {
        Write-Information 'Correlating GoodHabitz account'

        $outputContext.AccountReference = $actionContext.Data.EmailAddress
        $outputContext.success = $true
        $outputContext.AuditLogs.Add([PSCustomObject]@{
                Action  = 'CorrelateAccount'
                Message = "Account [$($actionContext.Data.EmailAddress)] successfully correlated on field [EmailAddress]"
                IsError = $false
            })
    }
}
catch {
    $outputContext.success = $false
    Write-Warning "Error at Line '$($_.InvocationInfo.ScriptLineNumber)': $($_.InvocationInfo.Line). Error: $($_.Exception.Message)"
    $outputContext.AuditLogs.Add([PSCustomObject]@{
            Message = "Could not create or correlate GoodHabitz account. Error: $($_.Exception.Message)"
            IsError = $true
        })
}