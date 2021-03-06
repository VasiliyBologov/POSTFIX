#!/bin/bash
echo "Privet Vaso" 
echo "  ------------" 
echo "  ------------" 
sudo apt-get update && echo "end line    +++++++++++++++++++++++" 
sudo apt-get install postfix && echo "end line    +++++++++++++++++++++++" 
sudo systemctl start postfix && echo "end line    +++++++++++++++++++++++" 
sudo systemctl enable postfix && echo "end line    +++++++++++++++++++++++" 
echo "Izmeni main.cf" && read -p "Press enter to continue"
sudo nano /etc/postfix/main.cf && echo "end line    +++++++++++++++++++++++" 
sudo systemctl reload postfix && echo "end line    +++++++++++++++++++++++" 
sudo postfix check && echo "end line    +++++++++++++++++++++++" 
mailq && echo "end line    +++++++++++++++++++++++" 
sudo ufw allow Postfix && echo "end line    +++++++++++++++++++++++" 
echo 'export MAIL=~/Maildir' | sudo tee -a /etc/bash.bashrc | sudo tee -a /etc/profile.d/mail.sh && echo "end line    +++++++++++++++++++++++" 
source /etc/profile.d/mail.sh && echo "end line    +++++++++++++++++++++++" 
sudo apt install s-nail && echo "end line    +++++++++++++++++++++++" 
sudo nano /etc/s-nail.rc && echo "end line    +++++++++++++++++++++++" 
echo 'init' | s-nail -s 'init' -Snorecord salesServer8 && echo "end line    +++++++++++++++++++++++" 
s-nail && echo "end line    +++++++++++++++++++++++" 
nano ~/test_message && echo "end line    +++++++++++++++++++++++" 
cat ~/test_message | s-nail -s 'Test email subject line' -r from_field_account vasiliybologov@gmail.com && echo "end line    +++++++++++++++++++++++" 
cat ~/test_message | s-nail -s 'Test email subject line' -r vasoadmin@xorai.tech vasiliybologov@gmail.com && echo "end line    +++++++++++++++++++++++" 
cd /home/salesServer8/Maildir && echo "end line    +++++++++++++++++++++++" 
cd /home/salesServer8 && echo "end line    +++++++++++++++++++++++" 
mkdir Maildir && echo "end line    +++++++++++++++++++++++" 
cd /home/salesServer8/Maildir && echo "end line    +++++++++++++++++++++++" 
ls && echo "end line    +++++++++++++++++++++++" 
ls -R ~/Maildir && echo "end line    +++++++++++++++++++++++" 
cat ~/test_message | s-nail -s 'Test email subject line' -r vasoadmin@xorai.tech vasiliybologov@gmail.com && echo "end line    +++++++++++++++++++++++" 
cat ~/test_message | s-nail -s 'Test email subject line' -r dmitrii.c@xorai.tech vasilii.b@xor.ai && echo "end line    +++++++++++++++++++++++" 
mailq && echo "end line    +++++++++++++++++++++++" 
sudo systemctl reload postfix && echo "end line    +++++++++++++++++++++++" 
sudo postfix flush && echo "end line    +++++++++++++++++++++++" 
sudo postconf -e 'home_mailbox= Maildir/' && echo "end line    +++++++++++++++++++++++" 
sudo postconf -e 'virtual_alias_maps= hash:/etc/postfix/virtual' && echo "end line    +++++++++++++++++++++++" 
sudo nano /etc/postfix/virtual && echo "end line    +++++++++++++++++++++++" 
sudo dpkg-reconfigure postfix && echo "end line    +++++++++++++++++++++++" 
sudo ufw allow Postfix && echo "end line    +++++++++++++++++++++++" 
source /etc/profile.d/mail.sh && echo "end line    +++++++++++++++++++++++" 
echo 'export MAIL=~/Maildir' | sudo tee -a /etc/bash.bashrc | sudo tee -a /etc/profile.d/mail.sh && echo "end line    +++++++++++++++++++++++" 
source /etc/profile.d/mail.sh && echo "end line    +++++++++++++++++++++++" 
echo 'init' | s-nail -s 'init' -Snorecord salesServer8 && echo "end line    +++++++++++++++++++++++" 
ls -R ~/Maildir && echo "end line    +++++++++++++++++++++++" 
s-nail && echo "end line    +++++++++++++++++++++++" 
cat ~/test_message | s-nail -s 'Test email subject line' -r vasoadmin@xorai.tech vasiliybologov@gmail.com && echo "end line    +++++++++++++++++++++++" 
mailq && echo "end line    +++++++++++++++++++++++" 
sudo service postfix restart && echo "end line    +++++++++++++++++++++++" 
mailq && echo "end line    +++++++++++++++++++++++" 
sudo postfix flush && echo "end line    +++++++++++++++++++++++" 
mailq && echo "end line    +++++++++++++++++++++++" 
service postfix status && echo "end line    +++++++++++++++++++++++" 
telnet localhost 25 && echo "end line    +++++++++++++++++++++++" 
iptables -A INPUT -p tcp --dport 25 -j ACCEPT && echo "end line    +++++++++++++++++++++++" 
sudo iptables -A INPUT -p tcp --dport 25 -j ACCEPT && echo "end line    +++++++++++++++++++++++" 
sudo netstat -lnpt && echo "end line    +++++++++++++++++++++++" 
sudo postconf mail_version && echo "end line    +++++++++++++++++++++++" 
dpkg -L postfix | grep /usr/sbin/ && echo "end line    +++++++++++++++++++++++" 
sudo ufw allow 25/tcp && echo "end line    +++++++++++++++++++++++" 
sudo nmap your-server-ip && echo "end line    +++++++++++++++++++++++" 
sudo nmap 13.78.187.47 && echo "end line    +++++++++++++++++++++++" 
sudo apt install nmap && echo "end line    +++++++++++++++++++++++" 
sudo nmap 13.78.187.47 && echo "end line    +++++++++++++++++++++++" 
cat ~/test_message | s-nail -s 'Test email subject line' -r dmitrii.c@xorai.tech vasilii.b@xor.ai && echo "end line    +++++++++++++++++++++++" 
mailq && echo "end line    +++++++++++++++++++++++" 
sudo postfix flush && echo "end line    +++++++++++++++++++++++" 
echo "First message" | mutt -s "msg" vasilii.b@xor.ai && echo "end line    +++++++++++++++++++++++" 
openssl req -new -x509 -nodes -out smtpd.pem -keyout smtpd.pem -days 3650 && echo "end line    +++++++++++++++++++++++" 
sudo s-nail && echo "end line    +++++++++++++++++++++++" 
sudo nano /etc/postfix/master.cf && echo "end line    +++++++++++++++++++++++" 
mailq && echo "end line    +++++++++++++++++++++++" 
sudo postsuper -d ALL && echo "end line    +++++++++++++++++++++++" 
mailq && echo "end line    +++++++++++++++++++++++" 
cd /var/log && echo "end line    +++++++++++++++++++++++" 
sudo chmod -R 777 mail.log && echo "end line    +++++++++++++++++++++++" 
sudo service postfix restart && echo "end line    +++++++++++++++++++++++" 
sudo nano /var/log/mail.log && echo "end line    +++++++++++++++++++++++" 
nslookup && echo "end line    +++++++++++++++++++++++" 
cd && echo "end line    +++++++++++++++++++++++" 
sudo systemctl start postfix && echo "end line    +++++++++++++++++++++++" 
sudo nano /var/log/mail.log && echo "end line    +++++++++++++++++++++++" 
cd /etc/postfix/virtual && echo "end line    +++++++++++++++++++++++" 
cd /etc/postfix && echo "end line    +++++++++++++++++++++++" 
mkdir virtual && echo "end line    +++++++++++++++++++++++" 
ls && echo "end line    +++++++++++++++++++++++" 
sudo nano /etc/postfix/virtual && echo "end line    +++++++++++++++++++++++" 
sudo postfix check && echo "end line    +++++++++++++++++++++++" 
sudo postfix status && echo "end line    +++++++++++++++++++++++" 
sudo dpkg-reconfigure postfix && echo "end line    +++++++++++++++++++++++" 
sudo postmap /etc/postfix/virtual && echo "end line    +++++++++++++++++++++++" 
sudo systemctl restart postfix && echo "end line    +++++++++++++++++++++++" 
sudo ufw allow Postfix && echo "end line    +++++++++++++++++++++++" 
echo 'export MAIL=~/Maildir' | sudo tee -a /etc/bash.bashrc | sudo tee -a /etc/profile.d/mail.sh && echo "end line    +++++++++++++++++++++++" 
source /etc/profile.d/mail.sh && echo "end line    +++++++++++++++++++++++" 
echo 'init' | s-nail -s 'init' -Snorecord salesServer8 && echo "end line    +++++++++++++++++++++++" 
sudo apt-get install -y s-nail && echo "end line    +++++++++++++++++++++++" 
echo 'init' | s-nail -s 'init' -Snorecord salesServer8 && echo "end line    +++++++++++++++++++++++" 
ls -R ~/Maildir && echo "end line    +++++++++++++++++++++++" 
s-nail && echo "end line    +++++++++++++++++++++++" 
sudo s-nail && echo "end line    +++++++++++++++++++++++" 
cat ~/test_message | s-nail -s 'Test email subject line' -r from_field_account vasiliybologov@gmail.com && echo "end line    +++++++++++++++++++++++" 
cat ~/test_message | s-nail -s 'Test email subject line' -r vasoadmin@xorhr.com vasiliybologov@gmail.com && echo "end line    +++++++++++++++++++++++" 