sudo apt-get update
# Install Apache
sudo apt-get install -y apache2
# Create a custom virtual host configuration
cat <<EOL | sudo tee /etc/apache2/sites-available/app1.conf
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html/app1

</VirtualHost>
EOL
# Create the document root directory
sudo mkdir -p /var/www/html/app1
# Create a simple index.html file
echo "<html><head><title>My Custom Site</title></head><body><h1>Hello, Terraform!</h1></body></html>" | sudo tee /var/www/html/app1/index.html
# Enable the custom site
sudo a2ensite app1
# Reload Apache to apply changes
sudo systemctl reload apache2

sudo chmod -R 777 /var/www/html 
sudo echo "Welcome to stacksimplify - WebVM App1 - VM Hostname: $(hostname)" > /var/www/html/index.html
sudo echo "Welcome to stacksimplify - WebVM App1 - VM Hostname: $(hostname)" > /var/www/html/app1/hostname.html
sudo echo "Welcome to stacksimplify - WebVM App1 - App Status Page" > /var/www/html/app1/status.html
sudo echo '<!DOCTYPE html> <html> <body style="background-color:rgb(250, 210, 210);"> <h1>Welcome to Stack Simplify - WebVM APP-1 </h1> <p>Terraform Demo</p> <p>Application Version: V1</p> </body></html>' | sudo tee /var/www/html/app1/index.html
sudo curl -H "Metadata:true" --noproxy "*" "http://169.254.169.254/metadata/instance?api-version=2020-09-01" -o /var/www/html/app1/metadata.html