import csv

Pcap_Ips = []
Mal_Ips = []
Ip_Matches = []

with open('Pcap-Ips.csv') as csvfile:
    Ip_Find = csv.reader(csvfile)
    for row in Ip_Find:
        Pcap_Ips.append(row[2])


with open('VT-Contacted-IPs.csv') as csvfile:
    Ip_Find = csv.reader(csvfile)
    for row in Ip_Find:
        for r in row:
            IP_Length = len(r)
            IP= ""
            num = 0
            while num < IP_Length:
                for char in r:
                    num+=1
                    if char in ["0","1","2","3","4","5","6","7","8","9","."]:
                        IP += char
                    if char == ":" and num > 6:
                        break
            Mal_Ips.append(IP)

def IP_Check(Pcap_Ips,Mal_Ips,Ip_Matches):
    for I in Pcap_Ips:
        if I in Mal_Ips:
            Ip_Matches.append(I)
        else:
            pass

    if len(Ip_Matches) > 0:
        print(f"{len(Ip_Matches)} matching IPs")
        print(Ip_Matches)
    else:
        print("There were no matching IPs")
        
IP_Check(Pcap_Ips,Mal_Ips,Ip_Matches)