#!/bin/bash
function certbotMakeKeys {
  sudo certbot certonly --webroot -w /var/www/html -d $NEWHOSTNAME --agree-tos --non-interactive --rsa-key-size 4096 --email enginesilver@gmail.com
  sudo sed -i "s,/path/to/certificate.crt,/etc/letsencrypt/live/$1/cert.pem,g" /etc/apache2/sites-available/default-ssl.conf
  sudo sed -i "s,/path/to/certificate.key,/etc/letsencrypt/live/$1/privkey.pem,g" /etc/apache2/sites-available/default-ssl.conf
  sudo a2enmod ssl
  sudo /etc/init.d/apache2 restart
}
certbotMakeKeys $1
