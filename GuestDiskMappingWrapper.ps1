$outputCollection = @()

$GuestInfo = Get-Partition | Select-Object DiskNumber, DriveLetter

$GcpInfo = Get-GcePdName

#Get System Name
$SystemName = 'System Server Name: ' + (Get-WmiObject Win32_OperatingSystem).CSName

#Declare headers for quering the Google GCP meta data server and split into variables
$headers = @{}

$headers.Add('metadata-flavor','Google')
$instanceZone = Invoke-RestMethod -Uri "http://metadata.google.internal/computeMetadata/v1/instance/zone" -H $headers
$projectHeader,$projectNumber,$zoneHeader,$zone = $instanceZone.Split("{/}")

$GuestInfo | Foreach-Object {
    
	#Associate objects
    
	$GuestObject = $_
    
	$GcpObject = $GcpInfo | Where-Object {$_.DeviceId -eq $GuestObject.DiskNumber}

    

	#Make a combined object
    
	$outputObject = "" | Select Name, DeviceId, DiskNumber, DriveLetter, Id    
	$outputObject.Name = $GcpObject.Name
    
	$outputObject.DeviceId = $GcpObject.DeviceId
    
	$outputObject.DiskNumber = $GuestObject.DiskNumber
	$outputObject.DriveLetter = $GuestObject.DriveLetter
	
	# Get GCP Global Unique Disk Id From Gcloud - Should update to get from API
	$diskGlobalId = gcloud compute disks describe $GcpObject.Name --zone $zone --format="value(id)"
	$outputObject.Id = $diskGlobalId
	
	#Add the object to the collection
    
	$outputCollection += $outputObject

}



$SystemName
$outputCollection