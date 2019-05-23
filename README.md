# GCP persistent Disk to Windows Guest  OS Mapping
This current work-a-round is a method for customer to use existing backup software vendors to map a specific guest drive and device id to a globally unique persistent GCP disk id (Since GCP doesn’t present the disk id in the guest).  This solution is based on a powershell module that a member from the Google engineering team has built https://github.com/pjh/gce-tools/tree/master/GceTools with an addition of an API call to our metadata server and gcloud commands.  Here is a video (https://drive.google.com/file/d/1Lr89BeLsKo672gs2TfO0KelcEZJRpPU7/view) of how it works.

Link to instructions with a couple of examples https://github.com/jonnyshannon/GCP-GuestDiskMapping/blob/master/Google%20GCP%20PD%20to%20Win%20Guest%20OS%20mapping.pdf

In order for this wrapper to work, you will need to download and install the following powershell module from another Git resository: https://github.com/pjh/gce-tools/tree/master/GceTools

# Installation Instructions:
1.  Build a Windows Instance
2.  Get the powershell module from Git repository (https://github.com/pjh/gce-tools/tree/master/GceTools)
3.  Follow the directions to build or import the module
4.  Download the powershell wrapper here (https://github.com/jonnyshannon/GCP-GuestDiskMapping/blob/master/GuestDiskMappingWrapper.ps1) and extract in the same directory as the powershell module in step #2
5.  In powershell, run the script .\GuestDiskMappingWrapper.ps1
