param([string]$ApprovalState)
try {
    Add-Type -AssemblyName 'Microsoft.UpdateServices.Administration' -ErrorAction Stop
    $wsus = [Microsoft.UpdateServices.Administration.AdminProxy]::GetUpdateServer()
    if ($wsus) {
        $updateScope = New-Object Microsoft.UpdateServices.Administration.UpdateScope
        $updateScope.ApprovedStates = $ApprovalState
        $count = ($wsus.GetUpdates($updateScope)).Count
        Write-Output $count
    } else {
        Write-Output 0
    }
}
catch {
    Write-Output 0
}
