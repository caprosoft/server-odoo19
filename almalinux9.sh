#!/bin/sh

sudo dnf upgrade -y

wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-3/wkhtmltox-0.12.6.1-3.almalinux9.x86_64.rpm
sudo dnf localinstall wkhtmltox-0.12.6.1-3.almalinux9.x86_64.rpm -y
rm wkhtmltox-0.12.6.1-3.almalinux9.x86_64.rpm

sudo dnf install -y postgresql-server
sudo postgresql-setup --initdb --unit postgresql
sudo systemctl enable postgresql
sudo systemctl start postgresql

sudo dnf config-manager --add-repo=https://nightly.odoo.com/19.0/nightly/rpm/odoo.repo
sudo dnf install -y odoo
sudo systemctl enable odoo
sudo systemctl start odoo
