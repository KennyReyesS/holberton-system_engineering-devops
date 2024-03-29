# Postmortem-Nginx
## Issue Summary:
On August 26, 2021, we discovered that after installing nginx on one of our servers, it could not listen on port 80. We tried doing a curl 0:80 but it showed us
```
root@966c5664b21f:/# curl 0:80
curl: (7) Failed to connect to 0 port 80: Connection refused
```

Looking through the configuration files we discovered that the server was listening on port 8080 and not on 80.

## Timeline:
* August 26 ~ 5:00 PM: After configuring the server we realized that we could not curl to port 0:80.
* August 26 ~ 5:05 PM: We first checked if the nginx service was running perfectly with the ps aux command.
* August 26 ~ 5:10 PM: We check that the path of the html file of our server configuration exists (/etc/nginx/sites-available/default).
* August 26 ~ 5:11 PM: We try to restart the Nginx service with sudo service nginx restart, in case the configuration changes have not been updated.
* August 26 ~ 5:15 PM: We checked the default file in the /etc/nginx/sites-available/ path and made a symbolic link to the /etc/nginx/sites-enable/ path.
* August 26 ~ 5:18 PM: We checked the default file in the path /etc/nginx/sites-enable/ and we found that in listen it was listening on port 8080 and not on 80.
* August 26 ~ 5:19 PM: We decided to change all listen to 80 and restart the nginx service with the new port, using curl 0:80 it showed us the html we were looking for.

## Root cause and resolution:
By default, Nginx HTTP server listens for incoming connection and binds on port 80, which represents the standard web port in this case it seems like when configuring the new server for the first time they copied the configuration of a server that served on port 8080, we discovered this error when after making the symbolic link and we realized that the default file (/etc/nginx/sites-enable/default) was listening on only port 8080 so we decided to create a script that changes the 8080 to 80 in the default nginx file and restart the service for the changes to take effect.

## Corrective and preventative measures:
In order to make Nginx HTTP server to listen for incoming web connections on other non-standard ports, we need to edit the main configuration file and change or add a new statement to reflect this fact, this is easier when we automate the configurations of our servers to avoid having basic errors and save time, it is recommended to create scripts that make the basic configurations of a new server if we always do the same configuration.
