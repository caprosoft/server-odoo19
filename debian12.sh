#!/bin/sh

apt update -y && apt upgrade -y

apt install wget -y

wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-3/wkhtmltox_0.12.6.1-3.bookworm_amd64.deb

dpkg -i wkhtmltox_0.12.6.1-3.bookworm_amd64.deb
apt-get install -f -y
dpkg -i wkhtmltox_0.12.6.1-3.bookworm_amd64.deb

rm wkhtmltox_0.12.6.1-3.bookworm_amd64.deb

apt install postgresql -y

apt install gpg -y

wget -q -O - https://nightly.odoo.com/odoo.key | gpg --dearmor -o /usr/share/keyrings/odoo-archive-keyring.gpg
echo 'deb [signed-by=/usr/share/keyrings/odoo-archive-keyring.gpg] https://nightly.odoo.com/19.0/nightly/deb/ ./' | tee /etc/apt/sources.list.d/odoo.list
apt-get update && apt-get install odoo
