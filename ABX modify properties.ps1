function handler($context, $inputs) {
    $output = {}
    $output = $inputs
    [regex]$InstanceNumber = "\d{2}$"
    $output.resourceNames[0] -match $InstanceNumber >> $null
    
    if ($output.customProperties.clusterName -like "notRequired") {
        if ($output.componentId -like "Node1") {
            $output.customProperties.clusterName = "Cluster" + ('{0:d2}' -f [int]$Matches[0])
        } else {
            $output.customProperties.clusterName = "Cluster" + ('{0:d2}' -f [int]$Matches[0] - 1)
        }
    }
    
    if ($output.customProperties.customHostname -like "notRequired") {
        if ($output.componentId -like "Node1") {
            $output.customProperties.peerNodeName = $output.resourceNames[0].trimEnd($Matches[0]) + ('{0:d2}' -f ([int]$Matches[0] + 1))
        } elseif ($output.componentId -like "Node2") {
            $output.customProperties.peerNodeName = $output.resourceNames[0].trimEnd($Matches[0]) + ('{0:d2}' -f ([int]$Matches[0] - 1))
        }
    }
    
    Write-Host ("NodeName: " + $output.resourceNames[0])
    Write-Host ("1")
    Write-Host ("peerNodeName: " + $output.customProperties.peerNodeName)
    Write-Host ("2")
    Write-Host ("clusterName: " + $output.customProperties.clusterName)
    Write-Host ("3")

    return $output
}
