# Wireshark
Scripts used to automate malware analysis in Wireshark!


Exported-HTTP.ps1
*****************
This is a script that is used to run a VirusTotal/Sigcheck on all exported HTTP files found in a pcap.
This script is not guaranteed to find all malicious files in a pcap, it is only capable of capturing files that have a detection rate higher than 0 on VirusTotal.

Insturctions:
For this script to work, you must download Tshark and ensure that it is located in its default file path - C:\Program Files\Wireshark\ 
Once the script is ran, Your file explorer will open. This is where you will find and open the pcap you wish to use. Next, you will be given a prompt to create a directory location for the script to function in.

*WARNING*
Once this script is ran, a folder named "suspicious-files" is made that may contain live viruses! You can use the "Sigcheck-of-files" folder to safely analyze the sigcheck of these malicious files.




Ip-Matcher.py
*************
This script can be used when you have a list of Pcap IPs and a list of known malicious IPs recorded on VirusTotal.
If the format of the IPs copied off of VirusTotal is not [protocol]://[IP]:[port] , then this script will not work. This script was custom made to work on a specific use case, and I will eventually work on making it unversal to all IP formats.

Instructions:
You will need to download the list of pcap IPs by opening wireshark and going to Statistics > IPv4 Statistics > All Addresses. Save this file in the same location as the script and with the name 'Pcap-Ips.csv'.
Once you have found a malicious file using VirusTotal, click the "Relations" tab and copy all IPs under the "Contacted URLs" section by clicking "Export Identifiers". Paste them in an editor, then save the file as 'VT-Contacted-IPs.csv' in the same directory.
Once you have done everything, open your terminal in the directory and run the script!
