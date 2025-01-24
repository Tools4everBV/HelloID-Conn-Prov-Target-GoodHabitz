############################################
# HelloID-Conn-Prov-Target-GoodHabitz-Update
# PowerShell V2
############################################

try {
    if (-not([string]::IsNullOrEmpty($actionContext.Data.EmailAddress))) {
        if ($actionContext.References.Account -ne $actionContext.Data.EmailAddress) {
            $outputContext.AccountReference = $actionContext.Data.EmailAddress
            $outputContext.PreviousData.EmailAddress = $actionContext.References.Account
            $outputContext.Success = $true
            $outputContext.AuditLogs.Add([PSCustomObject]@{
                    Message = "AccountReference [$($actionContext.Data.EmailAddress)] successfully updated on field [EmailAddress]"
                    IsError = $false
                })
        }
        else {
            Write-Information 'NoChanges needed for AccountReference'
            $outputContext.Success = $true
        }
    } else {
        throw "Mapping EmailAddress is empty this is likely a mapping error"
    }
}
catch {
    $outputContext.Success = $false
    Write-Warning "Error at Line '$($_.InvocationInfo.ScriptLineNumber)': $($_.InvocationInfo.Line). Error: $($_.Exception.Message)"
    $outputContext.AuditLogs.Add([PSCustomObject]@{
            Message = "Could not create or correlate GoodHabitz account. Error: $($_.Exception.Message)"
            IsError = $true
        })
}