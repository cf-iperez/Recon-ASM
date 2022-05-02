#!/bin/bash
clear
BYellow='\033[1;33m'
BRed='\033[1;31m'
BGreen='\033[1;32m' 
BWhite='\033[1;37m'
                
echo -e "$BYellow|                                 .::..              |"        
echo -e "$BYellow|                              .:::::::::.           |"        
echo -e "$BYellow|                          ..::::::...::::::..       |"        
echo -e "$BYellow|                      .:==-:::..       .:::::::.    |"        
echo -e "$BYellow|                   :-=++++===:            ..::::.   |"        
echo -e "$BYellow|               .:==+++==-==+++==:.          ::::.   |"        
echo -e "$BYellow|            :-=++++=-.:::::.-=++++=-:       ::::.   |"        
echo -e "$BYellow|           -+====:.   .:::.   .:-===+:      ::::.   |"        
echo -e "$BYellow|           -+=+-      .:::.      -+=+:      ::::.   |"        
echo -e "$BYellow|           -+=+-      .:::.      -+=+:      ::::.   |"        
echo -e "$BYellow|           -+=+-      .::::..    -+=+:    ..::::.   |"        
echo -e "$BYellow|           -+=+-       .:::::::. -+=+: .:::::::.    |"        
echo -e "$BYellow|           -+=+:          ..:::::-===-:::::..       |"        
echo -e "$BYellow|           -+===:.            .--===+=::.           |"        
echo -e "$BYellow|           .-=++++=-.       .-==+++=-.              |"        
echo -e "$BYellow|              .:==+++=-:.:-=+++==-.                 |"        
echo -e "$BYellow|                 .:-=+++++++=-:.                    |"        
echo -e "$BYellow|                     .-===-.                        |"
echo -e "$BYellow|----------------------------------------------------|"
echo -e "$BYellow|              Coalfire DNS Recon Tool               |"
echo -e "$BYellow|----------------------------------------------------|"
echo -e "$BYellow|                 by Ignacio Pérez                   |"
echo -e "$BYellow|----------------------------------------------------|"

#Tools path
findomain=bin/findomain
subfinder=bin/subfinder
amass=bin/amass
assetfinder=bin/assetfinder
waybackurls=bin/waybackurls
hakrevdns=bin/hakrevdns
metabigor=bin/metabigor

directory_name=~/Desktop/Projects

if [ -d "$directory_name" ]; then
   echo "$directory_name Directory already exists" ;
else
   mkdir -p $directory_name;
    echo "$directory_name directory has been created"
fi


read -p "Put the Project Name: " projName
read -p "Put the domain to search: " domain


if [ "$domain" != "" ]
then
	echo -e  "$BGreen Launching recon for the domain: $domain"

	echo -e  "$BWhite[>] $BYellow Creating folder to save the outputs..."
	mkdir ~/Desktop/Projects/$projName

	echo -e  "$BYellow--------------------------------------------------------------------------------------------------------------------------------------------------------------"

	echo -e  "$BWhite[>] $BYellow Searching domains with findomain... "
	$findomain -u ~/Desktop/Projects/$projName/Findomain_$projName --target $domain

	echo -e  "$BYellow--------------------------------------------------------------------------------------------------------------------------------------------------------------"

	echo -e  "$BWhite[>] $BYellow Searching domains with subfinder... "
	$subfinder -d $domain -o ~/Desktop/Projects/$projName/Subfinder_$projName

	echo -e  "$BYellow--------------------------------------------------------------------------------------------------------------------------------------------------------------"

	echo -e  "$BWhite[>] $BYellow Searching domains with Amass... "
	$amass dns -d $domain > ~/Desktop/Projects/$projName/Amass_$projName.txt

	echo -e  "$BYellow--------------------------------------------------------------------------------------------------------------------------------------------------------------"

	echo -e  "$BWhite[>] $BYellow Searching domains with assetfinder... "
	$assetfinder $domain > ~/Desktop/Projects/$projName/AssetFinder_$projName.txt

	echo -e  "$BYellow--------------------------------------------------------------------------------------------------------------------------------------------------------------"

	echo -e  "$BWhite[>] $BYellow Searching domains with waybackurls... "
	$waybackurls $domain > ~/Desktop/Projects/$projName/WayBackUrls_$projName.txt

	echo -e  "$BYellow--------------------------------------------------------------------------------------------------------------------------------------------------------------"

	echo -e  "$BWhite[>] $BYellow Searching domains with hakrevdns... "

	echo -e  "$BYellow--------------------------------------------------------------------------------------------------------------------------------------------------------------"

	echo -e  "$BWhite[>] $BYellow Searching domains with metabigor... "
	echo -e  $domain | $metabigor net --org -v -o ~/Desktop/Projects/$projName/Metabigor_$projName

	echo -e  "$BYellow--------------------------------------------------------------------------------------------------------------------------------------------------------------"

	echo -e  "$BGreen Your search has been finished and saved in ~/Desktop/Projects/"$projName

else
	echo -e  "$BRed Please, put some domain to launch the recon-tools!"
fi

