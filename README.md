# GCP persistent Disk to Windows Guest  OS Mapping
This current work-a-round is a method for customer to use existing backup software vendors to map a specific guest drive and device id to a globally unique persistent GCP disk id (Since GCP doesn’t present the disk id in the guest).  This solution is based on a powershell module that a member from the Google engineering team has built (Github) with an API call to our metadata server and gcloud commands.  Here is a video of how it works.

In order for this wrapper to work, you will need to download and install the following powershell module from another Git resository: https://github.com/pjh/gce-tools/tree/master/GceTools

1.  Installation Instructions:
2.  Build a Windows Instance
3.  Get the powershell module from Git
4.  Follow the directions to import the module
5.  Download the powershell wrapper here and extract in the same directory as the powershell module in step #2
6.  In powershell, run the script .\GuestDiskMappingWrapper.ps1
