############################################
# HelloID-Conn-Prov-Target-GoodHabitz-Create
# PowerShell V2
############################################

try {
    if (-not([string]::IsNullOrEmpty($actionContext.Data.EmailAddress))) {
        Write-Information 'Correlating GoodHabitz account'
        
        $outputContext.AccountReference = $actionContext.Data.EmailAddress
        $outputContext.success = $true
        $outputContext.AuditLogs.Add([PSCustomObject]@{
                Action  = 'CorrelateAccount'
                Message = "Account [$($actionContext.Data.EmailAddress)] successfully correlated on field [EmailAddress]"
                IsError = $false
            })
    }
    else {
        throw "Mapping EmailAddress is empty this is likely a mapping error"
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