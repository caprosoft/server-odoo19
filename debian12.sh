#!/bin/sh

sudo apt update -y && sudo apt upgrade -y

wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-3/wkhtmltox_0.12.6.1-3.bookworm_amd64.deb
sudo dpkg -i wkhtmltox_0.12.6.1-3.bookworm_amd64.deb
sudo apt-get install -f -y
sudo dpkg -i wkhtmltox_0.12.6.1-3.bookworm_amd64.deb
rm wkhtmltox_0.12.6.1-3.bookworm_amd64.deb

sudo apt install postgresql -y

wget -q -O - https://nightly.odoo.com/odoo.key | sudo gpg --dearmor -o /usr/share/keyrings/odoo-archive-keyring.gpg
echo 'deb [signed-by=/usr/share/keyrings/odoo-archive-keyring.gpg] https://nightly.odoo.com/19.0/nightly/deb/ ./' | sudo tee /etc/apt/sources.list.d/odoo.list
sudo apt-get update && sudo apt-get install odoo
