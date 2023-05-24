# Wireshark
Scripts used to automate malware analysis with Wireshark!


## Exported-HTTP.ps1

This is a script that is used to run a VirusTotal/Sigcheck on all exported HTTP objects found in a pcap.
This script is not guaranteed to find all malicious files in a pcap, it is only capable of capturing files that have a detection rate higher than 0 on VirusTotal.

##### Requirements:   Tshark

##### Instructions:
Once the script is ran, Your file explorer will open. This is where you will find and open the pcap you wish to use. Next, you will be given a prompt to create a directory location for the script to function in.

***WARNING***:
Once this script is ran, the folder named "suspicious-files" may contain live viruses! You can use the "Sigcheck-of-files" folder to safely analyze the sigcheck of these malicious files!
