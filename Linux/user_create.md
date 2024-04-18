# Linux Create User Commands

## Add User Command:
* The adduser command is a high-level command that creates a new user account with default settings and prompts you to set a password and additional information interactively.

```
sudo adduser username
```

## Using useradd Command:
* The useradd command is a lower-level command that adds a new user to the system, but it doesn't create a home directory or set a password by default. You'll need to use additional options to specify these settings.

```
sudo useradd -m -s /bin/bash username
```
** -m: This option creates a home directory for the user.
** -s /bin/bash: This option sets the user's shell to /bin/bash.

* After running the useradd command, you should set a password for the new user using the passwd command:

```
sudo passwd username
```
* Replace username with the username you created. You'll be prompted to enter and confirm the password for the new user. 

## Additional Options:

** Here are some additional options you can use with useradd to customize the user creation process:

***    -c "Comment": Add a comment or description for the user.
***    -G group1,group2,...: Add the user to additional supplementary groups.
***    -e YYYY-MM-DD: Set an expiration date for the user account.
***    -u UID: Set a specific UID (user ID) for the user.
***    -d /path/to/home: Specify a custom home directory for the user.