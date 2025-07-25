try {
    Add-Type -AssemblyName 'Microsoft.UpdateServices.Administration' -ErrorAction Stop
    $wsus = [Microsoft.UpdateServices.Administration.AdminProxy]::GetUpdateServer()
    if ($wsus) {
        $computerScope = New-Object Microsoft.UpdateServices.Administration.ComputerTargetScope
        $count = ($wsus.GetComputerTargets($computerScope) | Where-Object { ($_.GetUpdateInstallationInfo().NotInstalledCount) -gt 0 }).Count
        Write-Output $count
    } else {
        Write-Output 0
    }
}
catch {
    Write-Output 0
}
