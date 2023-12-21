function handler($context, $inputs) {
    $output = {}
    $output = $inputs
    
    Write-Host ("1")
    Write-Host ($output.resourceNames[0])
    Write-Host ("2")
    Write-Host ($output.componentId)
    Write-Host ("3")
    Write-Host ($output.customProperties.image)
    
    $output | Add-Member  -notepropertyname "Test" -notepropertyValue "TestAbxProperty"
    
    Write-Host ($output.Test)
    
    $output.PSobject.Properties.Remove("Test")
    return $output
}
