
echo "Hello run XOR smtp ?" ;

echo "You configure the server with IP: 52.250.2.34 and domain name : xorai.technology" && read -p "Press enter to continue" 

sudo apt-get update;
sudo apt-get install -y postfix;
sudo service postfix status;
echo -e "# See /usr/share/postfix/main.cf.dist for a commented, more complete version


# Debian specific:  Specifying a file name will cause the first
# line of that file to be used as the name.  The Debian default
# is /etc/mailname.
#myorigin = /etc/mailname

smtpd_banner = \$myhostname ESMTP \$mail_name (Ubuntu)
biff = no

# appending .domain is the MUA's job.
append_dot_mydomain = no

# Uncomment the next line to generate "delayed mail" warnings
#delay_warning_time = 4h

readme_directory = no

# See http://www.postfix.org/COMPATIBILITY_README.html -- default to 2 on
# fresh installs.
compatibility_level = 2


# See /usr/share/doc/postfix/TLS_README.gz in the postfix-doc package for
# information on enabling SSL in the smtp client.

smtpd_relay_restrictions = permit_mynetworks permit_sasl_authenticated permit_inet_interfaces defer_unauth_destination
myhostname = xorai.technology
mydomain = xorai.technology
alias_maps = hash:/etc/aliases
alias_database = hash:/etc/aliases
myorigin = xorai.technology
mydestination = xorai.technology, mail.xorai.technology, localhost
relayhost =
mynetworks = 77.89.214.82, 40.118.91.139
mailbox_size_limit = 0
recipient_delimiter = +
inet_interfaces = all
inet_protocols = all
policyd-spf_time_limit = 3600


# Milter configuration DKIM parametrs
milter_default_action = accept
milter_protocol = 6
smtpd_milters = local:opendkim/opendkim.sock
non_smtpd_milters = \$smtpd_milters



#TLS parameters  in main.cf

smtpd_tls_key_file=/etc/postfix/postfix_default.pem
smtpd_tls_cert_file=\$smtpd_tls_key_file
smtpd_use_tls = yes
smtpd_use_tls=yes
smtp_use_tls = yes
smtpd_tls_CAfile = \$smtpd_tls_key_file
smtpd_tls_loglevel = 1
smtpd_tls_received_header = yes
smtpd_tls_session_cache_timeout = 3600s
tls_random_source = dev:/dev/urandom


home_mailbox = Maildir/
virtual_alias_maps = hash:/etc/postfix/virtual
smtp_helo_name = mail.xorai.technology
" > /etc/postfix/main.cf;


sudo service postfix restart;


echo "ADD DKIM" && read -p "Press enter to continue" 




sudo apt install opendkim opendkim-tools -y;
sudo gpasswd -a postfix opendkim;


echo "change /etc/opendkim.conf "

echo -e "# This is a basic configuration that can easily be adapted to suit a standard
# installation. For more advanced options, see opendkim.conf(5) and/or
# /usr/share/doc/opendkim/examples/opendkim.conf.sample.

# Log to syslog
Syslog                  yes
# Required to use local socket with MTAs that access the socket as a non-
# privileged user (e.g. Postfix)
UMask                   007

# Sign for example.com with key in /etc/dkimkeys/dkim.key using
# selector '2007' (e.g. 2007._domainkey.example.com)
#Domain                 example.com
#KeyFile                /etc/dkimkeys/dkim.key
#Selector               2007

# Commonly-used options; the commented-out versions show the defaults.
Canonicalization        relaxed/simple
Mode                    sv
SubDomains              no


#ADSPAction continue

AutoRestart         yes
AutoRestartRate     10/1M
Background          yes
DNSTimeout          5
SignatureAlgorithm  rsa-sha256


# Socket smtp://localhost
#
# ##  Socket socketspec
# ##
# ##  Names the socket where this filter should listen for milter connections
# ##  from the MTA.  Required.  Should be in one of these forms:
# ##
# ##  inet:port@address           to listen on a specific interface
# ##  inet:port                   to listen on all interfaces
# ##  local:/path/to/socket       to listen on a UNIX domain socket
#
#Socket                  inet:8892@localhost
#Socket                 local:/var/run/opendkim/opendkim.sock
Socket                 local:/var/spool/postfix/opendkim/opendkim.sock
##  PidFile filename
###      default (none)
###
###  Name of the file where the filter should write its pid before beginning
###  normal operations.
#
PidFile               /var/run/opendkim/opendkim.pid


# Always oversign From (sign using actual From and a null From to prevent
# malicious signatures header fields (From and/or others) between the signer
# and the verifier.  From is oversigned by default in the Debian pacakge
# because it is often the identity key used by reputation systems and thus
# somewhat security sensitive.
OversignHeaders         From

##  ResolverConfiguration filename
##      default (none)
##
##  Specifies a configuration file to be passed to the Unbound library that
##  performs DNS queries applying the DNSSEC protocol.  See the Unbound
##  documentation at http://unbound.net for the expected content of this file.
##  The results of using this and the TrustAnchorFile setting at the same
##  time are undefined.
##  In Debian, /etc/unbound/unbound.conf is shipped as part of the Suggested
##  unbound package

# ResolverConfiguration     /etc/unbound/unbound.conf

##  TrustAnchorFile filename
##      default (none)
##
## Specifies a file from which trust anchor data should be read when doing
## DNS queries and applying the DNSSEC protocol.  See the Unbound documentation
## at http://unbound.net for the expected format of this file.

TrustAnchorFile       /usr/share/dns/root.key

##  Userid userid
###      default (none)
###
###  Change to user "userid" before starting normal operation?  May include
###  a group ID as well, separated from the userid by a colon.
#
UserID                opendkim
# Map domains in From addresses to keys used to sign messages
KeyTable            refile:/etc/opendkim/key.table
SigningTable        refile:/etc/opendkim/signing.table

# Hosts to ignore when verifying signatures
ExternalIgnoreList  /etc/opendkim/trusted.hosts

# A set of internal hosts whose mail should be signed
InternalHosts /etc/opendkim/trusted.hosts

" > /etc/opendkim.conf;


sudo mkdir /etc/opendkim;
sudo mkdir /etc/opendkim/keys;

sudo chown -R opendkim:opendkim /etc/opendkim;
sudo chmod go-rw /etc/opendkim/keys;


echo "change /etc/opendkim/signing.table "

echo -e "*@xorai.technology    default._domainkey.xorai.technology" > /etc/opendkim/signing.table;


echo "change /etc/opendkim/key.table "

echo -e "default._domainkey.xorai.technology    xorai.technology:default:/etc/opendkim/keys/xorai.technology/default.private" > /etc/opendkim/key.table;


echo "change /etc/opendkim/trusted.hosts"

echo -e "127.0.0.1
localhost

*.xorai.technology
" > /etc/opendkim/trusted.hosts;


sudo mkdir /etc/opendkim/keys/xorai.technology;
sudo opendkim-genkey -b 2048 -d xorai.technology -D /etc/opendkim/keys/xorai.technology -s default -v;
sudo chown opendkim:opendkim /etc/opendkim/keys/xorai.technology/default.private;

#echo "ADD ~cloudflare.com ~ DKIM - TXT - default._domainkey " && read -p "Press enter to continue" 

sudo cat /etc/opendkim/keys/xorai.technology/default.txt;

echo "ADD ~cloudflare.com ~ DKIM - TXT - default._domainkey " && read -p "Press enter to continue" 	



sudo opendkim-testkey -d xorai.technology -s default -vvv && read -p "Press enter to continue" 

sudo mkdir /var/spool/postfix/opendkim;
sudo chown opendkim:postfix /var/spool/postfix/opendkim;

echo "change /etc/default/opendkim "

echo -e "# Command-line options specified here will override the contents of
# /etc/opendkim.conf. See opendkim(8) for a complete list of options.
#DAEMON_OPTS=""
# Change to /var/spool/postfix/var/run/opendkim to use a Unix socket with
# postfix in a chroot:
#RUNDIR=/var/spool/postfix/var/run/opendkim
RUNDIR=/var/run/opendkim
#
# Uncomment to specify an alternate socket
# Note that setting this will override any Socket value in opendkim.conf
# default:
#SOCKET=local:\$RUNDIR/opendkim.sock
SOCKET="local:/var/spool/postfix/opendkim/opendkim.sock"
# listen on all interfaces on port 54321:
#SOCKET=inet:54321
# listen on loopback on port 12345:
#SOCKET=inet:12345@localhost
# listen on 192.0.2.1 on port 12345:
#SOCKET=inet:12345@192.0.2.1
USER=opendkim
GROUP=opendkim
PIDFILE=\$RUNDIR/\$NAME.pid
EXTRAAFTER=
" > /etc/default/opendkim;


sudo systemctl restart opendkim postfix;

echo "ADD SSL " && read -p "Press enter to continue" 

cd /etc/postfix/;



sudo openssl req -new -x509 -nodes -out postfix_default.pem -keyout postfix_default.pem -days 3650 -subj '/C=US/ST=CA/L=SF/O=XOR/OU=dev/emailAddress=admin@xorai.technology/CN=xorai.technology';

sudo cd;

sudo cat /etc/opendkim/keys/xorai.technology/default.txt;

sudo service postfix restart;


echo "# See man 5 aliases for format
postmaster:    root
root: replay@xorai.tech
" > /etc/aliases;

echo "@xorai.technology	root" > /etc/postfix/virtual;


sudo postmap /etc/postfix/virtual;


sudo newaliases;


sudo /etc/init.d/postfix restart;


echo "run git glockapp test";



