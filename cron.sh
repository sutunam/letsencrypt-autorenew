#!/bin/bash

LETSENCRYPT_DIRECTORY=">/PathToLetsencrypt/letsencrypt/"
CONFIG_PATH=">/PathToLetsencrypt/letsencrypt/cli.ini"

echo "
################
# Script Start #
################"
# We display date
date

cd LETSENCRYPT_DIRECTORY

#array domains
declare -A DOMAINS
#you can add more elements
DOMAINS["MYDOMAIN.TLD"]="/home/MYDOMAIN.TLD/public_html/"
DOMAINS["MYDOMAIN2.TLD"]="/home/MYDOMAIN2.TLD/public_html/"

for i in "${!DOMAINS[@]}"
do
	#domain name
	domain=$i
	#domain path
	path=${DOMAINS[$domain]};

	echo -e "\nDomain $i : \n############################################"
	#run command
	result=$(./letsencrypt-auto --config ${CONFIG_PATH} -d ${domain} --authenticator webroot --webroot-path ${path} certonly)
	echo "${result}"

	#display command
	#echo "./letsencrypt-auto --config ${CONFIG_PATH} -d ${domain} --authenticator webroot --webroot-path ${path} certonly";
done

echo "Reload Apache"
/etc/init.d/apache2 reload

# We display date
echo "End of script"
date