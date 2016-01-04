# letsencrypt-autorenew
Bash script for auto renew let's encrypt ssl certificates

As you may know all certificates are for 3 months.
So you need to renew them everery three monthes. Ouch

Here a way to automate it.

1) Configure config file
nano /PathToLetsencrypt/letsencrypt/cli.ini

2) Edit script to add your domains that you want to renew certificates
nano /PathToLetsencrypt/letsencrypt/cron.sh

3) Don't forget to make it executable
chmod +x /PathToLetsencrypt/letsencrypt/cron.sh

4) Cron exmple: Every month
1 1 1 * * /PathToLetsencrypt/letsencrypt/cron.sh >> /PathToLetsencrypt/letsencrypt/cron.log
