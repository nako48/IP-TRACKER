#!/bin/bash
#Tatsumi-Crew & Arvan Apriyana
clear
header(){
CYAN='\e[36m'
BLUE='\e[34m'
GREEN='\e[92m'
WHITE='\e[37m'
RED='\e[31m'
YELLOW='\e[33m'
GREENLIGHT='\e[39m'
PURPLE='\e[35m'
BOLD='\e[1m'
printf "
${GREEN}
___________________________________________________________

 ████████╗ █████╗ ████████╗███████╗██╗   ██╗███╗   ███╗██╗
 ╚══██╔══╝██╔══██╗╚══██╔══╝██╔════╝██║   ██║████╗ ████║██║${BLUE}
    ██║   ███████║   ██║   ███████╗██║   ██║██╔████╔██║██║
    ██║   ██╔══██║   ██║   ╚════██║██║   ██║██║╚██╔╝██║██║
    ██║   ██║  ██║   ██║   ███████║╚██████╔╝██║ ╚═╝ ██║██║${RED}
    ╚═╝   ╚═╝  ╚═╝   ╚═╝   ╚══════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝
  
  	                  Tracking IP  ${WHITE}
  	              www.tatsumi-crew.net
___________________________________________________________

"
}
scanskrng(){
	myip="$1"
	curlnya=$(curl -s "https://ipapi.co/$1/json" -L)
	ipnya=$(echo $curlnya | grep -Po '(?<="ip":)[^,]*' | tr -d '[]"')
	citynya=$(echo $curlnya | grep -Po '(?<="city":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
	regionnya=$(echo $curlnya | grep -Po '(?<="region":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
	region_codenya=$(echo $curlnya | grep -Po '(?<="region_code":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
	countrynya=$(echo $curlnya | grep -Po '(?<="country":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
	country_namenya=$(echo $curlnya | grep -Po '(?<="country_name":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
	continent_codenya=$(echo $curlnya | grep -Po '(?<="continent_code":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
	timezonenya=$(echo $curlnya | grep -Po '(?<="timezone":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
	utc_offsetnya=$(echo $curlnya | grep -Po '(?<="utc_offset":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
	country_calling_codenya=$(echo $curlnya | grep -Po '(?<="country_calling_code":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
	currencynya=$(echo $curlnya | grep -Po '(?<="currency":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
	languagesnya=$(echo $curlnya | grep -Po '(?<="languages":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
	asnnya=$(echo $curlnya | grep -Po '(?<="asn":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
	orgnya=$(echo $curlnya | grep -Po '(?<="org":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
	latitude1=$(echo $curlnya | grep -Po '(?<="latitude":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
	longitude1=$(echo $curlnya | grep -Po '(?<="longitude":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
	if [[ ! $curlnya =~ "NAKO" ]]; then
	printf "${WHITE}IP Address : ${YELLOW}$ipnya\n"
	printf "${WHITE}City : ${YELLOW}$citynya\n"
	printf "${WHITE}Region : ${YELLOW}$regionnya\n"
	printf "${WHITE}Country : ${YELLOW}$countrynya\n"
	printf "${WHITE}Latitude / Longitude : ${YELLOW}$latitude1/$longitude1\n"
	printf "${WHITE}Time Zone : ${YELLOW}$timezonenya\n"
	printf "${WHITE}Calling Code : ${YELLOW}$country_calling_codenya\n"
	printf "${WHITE}Currency : ${YELLOW}$currencynya\n"
	printf "${WHITE}Languages : ${YELLOW}$languagesnya\n"
	printf "${WHITE}ASN : ${YELLOW}$asnnya\n"
	printf "${WHITE}Org : ${YELLOW}$orgnya\n"
	printf "${WHITE}Maps : https://maps.googleapis.com/maps/api/staticmap?center=$latitude1,$longitude1&size=464x250&zoom=15\n"
           else
    printf "${RED}NOT FOUND${NC} => $curlnya\n"
fi
}
header
echo "Method : "
echo "1. Track IP"
read -p "Choose Your Method : " method;

if [ $method -eq 1 ]; then
	read -p "Masukan IP : " myip;
	for pwna in $myip; do
		scanskrng $pwna
done
fi