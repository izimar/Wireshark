# Wireshark
Scripts used to automate malware analysis with Wireshark!


## Exported-HTTP.ps1

This is a script that is used to run a VirusTotal/Sigcheck on all exported HTTP files found in a pcap.
This script is not guaranteed to find all malicious files in a pcap, it is only capable of capturing files that have a detection rate higher than 0 on VirusTotal.

##### Requirements:   Tshark

##### Instructions:
Once the script is ran, Your file explorer will open. This is where you will find and open the pcap you wish to use. Next, you will be given a prompt to create a directory location for the script to function in.

***WARNING***:
Once this script is ran, the folder named "suspicious-files" may contain live viruses! You can use the "Sigcheck-of-files" folder to safely analyze the sigcheck of these malicious files!




## Ip-Matcher.py

This script can be used when you have a list of Pcap IPs and a list of known malicious IPs recorded on VirusTotal that you wish to compare each other to.

##### Requirements:   Python 3.10

##### Instructions:
- You will need to download the list of IPs in your pcap by opening wireshark and going to Statistics > IPv4 Statistics > All Addresses. 
- Save this file in the same location as the script and with the name 'Pcap-Ips.csv'.
- Once you have found a malicious file using VirusTotal, click the "Relations" tab and copy all IPs under the "Contacted URLs" or "Contacted IP Addresses" section by ---- clicking "Export Identifiers". Paste them in an editor, then save the file as 'VT-Contacted-IPs.csv' in the same directory.
