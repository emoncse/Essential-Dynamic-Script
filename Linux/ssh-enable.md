# How to enable ssh on a remote Linux (Ubuntu/Debian) machine

## Install SSH Server (if not already installed):

* If you haven't already installed the SSH server, you can do so by running the following command:

```
sudo apt update
sudo apt install openssh-server

```
** This command will install the OpenSSH server package, which provides the SSH server daemon (sshd) on Ubuntu.

* Start the SSH Service:
** If the SSH server is not already running, you can start it using the following command:
```
sudo systemctl start ssh
```

* To ensure that the SSH server starts automatically upon system boot, you can enable it with and check it is working or not:

```
sudo systemctl enable ssh
sudo systemctl status ssh
```

* Configure SSH Server (Optional):

** The default configuration should be sufficient for most use cases. However, if you need to customize the SSH server configuration, you can edit the /etc/ssh/sshd_config file.
```
sudo nano /etc/ssh/sshd_config
or
sudo vim  /etc/ssh/sshd_config
```
** Then active port 22, Incoming request from group or anyone, so listen 0.0.0.0, and also enable IPv6 if you need, then save it.

* Allow Port 22 in the Firewall:

** If a firewall is enabled on your Ubuntu system, you need to allow inbound connections on port 22 for SSH. You can use the ufw (Uncomplicated Firewall) utility to manage the firewall rules:

```
sudo ufw allow ssh
```
** Rules will be updated for 22 port

* Restart SSH Service:

** After making any changes to the SSH server configuration or firewall rules, you should restart the SSH service for the changes to take effect:

```
sudo systemctl restart ssh
```

* Verify SSH Connectivity:

** You can now verify that SSH is accessible on port 22 by attempting to connect to your Ubuntu server from another machine:

```
ssh username@<ubuntu_server_ip>
```

You will have to input Yes when the you have asked to join with fingerprint key, then make sure you have type the correct password for the remote pc username password.