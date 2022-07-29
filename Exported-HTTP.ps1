#Loading in the System.Windows.Forms assembly
Add-Type -AssemblyName System.Windows.Forms

#Instantiating an OpenFileDialog object using New-Object, and using showDialog method for user interaction
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ InitialDirectory = [Environment]::GetFolderPath('Desktop') }
$Browse = $FileBrowser.ShowDialog()

#Prompting user to input desired directory location
$dir = Read-Host -Prompt "Please create a folder to store HTTP objects in"

#Making desired directory and child folders required for script to function
mkdir $dir
cd $dir
mkdir Exported_HTTP, Text_of_Files

#Grabbing file path of pcap for further use in tshark
$pcap_file = $FileBrowser | select "Filename"

#Declaring variable for tshark export
$protocol = "http"
$pcap_dir = "Exported_HTTP"

#Grabbing HTTP objects and saving to "Exported_HTTP" folder
C:\"Program Files"\Wireshark\tshark.exe -Q -r $pcap_file.FileName --export-objects "$protocol,$pcap_dir"

#Opening Exported_HTTP folder to Watch the script do it's magic!
ii "Exported_HTTP"

#Grabbing path of saved HTTP files
$Exported = Get-ChildItem -Path "Exported_HTTP"

#for-loop iterating through each HTTP object in "Exported_HTTP" folder
foreach ($E in $Exported){
    #Signature/VirusTotal check on each file in path  
    $VT_check = C:\ProgramData\chocolatey\bin\sigcheck.exe -h -v $E.fullname 

    #Checks whether the column containing "VT Detection rate" has a value higher than 0, meaning it has been flagged by AV vendors, and may be malicious.
    $check = $VT_check | select-string -pattern "VT Detection" | Select-string -NotMatch -Pattern "0/"
    
    #The output of $check will either be an emtpy string, meaning the select-string pipping has nothing to grab, or $check will be a full sigcheck of a suspicious file. 
    # "-notlike $null" takes advantage of this by seeing if $check has any data in it. If it does, the sigcheck is saved as a text file for the user to analyze.
    if($check -notlike $null){$VT_check > ".\Text_of_Files\$E.txt"}

    #If $check is empty, then the file is deleted as it does not have a VirusTotal signature higher than 0
    else{del $E.fullname}
            }

#Renaming "Exported_HTTP" folder to better suit its new use case
Rename-Item -path Exported_HTTP -NewName Suspicious_Files
