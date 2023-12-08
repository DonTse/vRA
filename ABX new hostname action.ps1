function Handler($context, $inputs) {

    $oldName = $inputs.resourceNames[0]
    $newName = $inputs.customProperties.customHostname

    $output= [PSCustomObject]@{
        resourceNames = $inputs.resourceNames
    }
    
    if ($newName -notlike "NotRequired") {
        $output.resourceNames[0] = $newName
        Write-Host "changing host name from $($oldName) to $($newName)"
        return $output
    } else {
        $output.resourceNames[0] = $oldName
        Write-Host "host name kept $($oldName)"
        return $output
    }
}
