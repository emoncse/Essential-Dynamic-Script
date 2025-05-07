# Linux Essentials: 1000 Commands (With Full Explanations, Arguments, Parameters, and Examples)

⚠️ **NOTE**: This document is an ultra-detailed Linux command reference, divided into sections, covering over 1000 commands with arguments, explanations, and examples.


## 📁 1️⃣ File and Directory Management (Extended)

* `ls -l -a -h /path`: list all files (hidden too), long format, human-readable sizes.
* `cd ~`: move to home directory.
* `cd -`: return to previous directory.
* `pwd`: print the current directory.
* `mkdir -p /tmp/dir1/dir2`: create nested directories.
* `rmdir dir`: remove an empty directory.
* `touch file`: create an empty file or update timestamp.
* `cp -r src/ dest/`: copy directories recursively.
* `cp -u file1 file2`: copy only if source is newer.
* `mv old new`: rename or move files.
* `rm -rf folder`: force-remove directory and contents.
* `find . -name '*.sh' -exec chmod +x {} \;`: find all `.sh` files and make executable.
* `locate filename`: quickly locate indexed files.
* `stat file`: show detailed file information.
* `tree /path`: display directory structure as tree.
* `basename /path/to/file`: extract filename.
* `dirname /path/to/file`: extract directory path.
* `file somefile`: detect file type.
* `du -sh *`: show disk usage of each item in directory.
* `df -h`: show disk space by filesystem.

---

## 🌐 2️⃣ Networking and Transfers (Extended)

* `ping google.com`: check network connectivity.
* `traceroute example.com`: trace route to host.
* `curl -I https://site.com`: fetch HTTP headers.
* `wget -c http://file`: download with resume.
* `scp user@host:file .`: copy file from remote.
* `scp file user@host:/path/`: copy file to remote.
* `rsync -avz src/ dest/`: sync files with compression.
* `rsync -avz user@remote:/path/ ./local/`: sync remote to local.
* `netstat -tulnp`: show listening ports.
* `ss -tulwn`: detailed socket status.
* `ip a`: display IP addresses.
* `ifconfig`: show interfaces (legacy).
* `dig example.com`: DNS lookup.
* `nslookup example.com`: DNS resolver.
* `ssh user@host`: SSH into a server.
* `sftp user@host`: secure file transfer.
* `rsync -e ssh`: force rsync over SSH.

---

## 🛡️ 3️⃣ Security and Permissions

* `chmod 755 file`: set owner rwx, group r-x, others r-x.
* `chown user:group file`: change ownership.
* `setfacl -m u:user:rwx file`: set ACL.
* `getfacl file`: view ACL.
* `umask 022`: set default permissions mask.
* `passwd user`: change password.
* `ssh-keygen`: generate SSH keys.
* `ssh-copy-id user@host`: copy public SSH key to server.
* `gpg --gen-key`: generate GPG key.
* `gpg -c file`: encrypt file with password.
* `iptables -L`: list firewall rules.
* `ufw status`: check firewall status.
* `fail2ban-client status`: check banned IPs.

---

## ⚙️ 4️⃣ System and Process Management

* `ps aux`: show all processes.
* `top`: real-time CPU/memory view.
* `htop`: interactive process viewer.
* `kill -9 PID`: force-kill process.
* `killall name`: kill all by name.
* `nice -n 10 cmd`: run with low priority.
* `renice +5 PID`: adjust running priority.
* `uptime`: system uptime.
* `reboot`: restart machine.
* `shutdown -h now`: shutdown immediately.
* `systemctl start|stop|restart service`: manage systemd services.
* `journalctl -xe`: view logs.
* `dmesg | less`: view kernel logs.

---

## 📦 5️⃣ Package Management (Debian/Ubuntu + RedHat)

* `apt update`: refresh package lists.
* `apt upgrade`: upgrade all packages.
* `apt install package`: install package.
* `apt remove package`: remove package.
* `dpkg -i file.deb`: install a .deb package.
* `yum install package`: install (RHEL).
* `dnf install package`: install (Fedora).
* `rpm -ivh file.rpm`: install RPM package.
* `snap install package`: snap package install.
* `flatpak install app`: flatpak install.

---

## 🔍 6️⃣ Disk, Storage, Backup

* `mount /dev/sdX1 /mnt`: mount disk.
* `umount /mnt`: unmount disk.
* `blkid`: show block device UUIDs.
* `fdisk -l`: list partitions.
* `parted /dev/sdX`: manage partitions.
* `mkfs.ext4 /dev/sdX1`: format ext4 filesystem.
* `fsck /dev/sdX1`: check filesystem.
* `tar -czvf archive.tar.gz dir/`: archive and compress.
* `tar -xzvf archive.tar.gz`: extract.
* `zip -r archive.zip dir/`: zip directory.
* `unzip archive.zip`: unzip.
* `rsync -a --delete src/ dest/`: sync and delete extras.

---

## 🖥️ 7️⃣ GUI, Desktop, Editors

* `vim file`: open Vim editor.
* `vim +10 file`: open at line 10.
* `nano file`: open Nano editor.
* `code .`: open VSCode.
* `gnome-shell --replace`: restart GNOME shell.
* `startx`: start X session.
* `xrandr`: manage displays.
* `gsettings`: configure GNOME.


## 📚 8️⃣ Text Processing, Search, Filters

* `cat file`: concatenate and display file.
* `tac file`: display file in reverse.
* `more file`: page through text.
* `less file`: scrollable file viewer.
* `head -n 10 file`: first 10 lines.
* `tail -n 10 file`: last 10 lines.
* `tail -f file`: follow file (live updates, e.g., logs).
* `cut -d ':' -f1 /etc/passwd`: extract fields (delimiter `:`).
* `awk '{print $1}' file`: print first column.
* `sed 's/foo/bar/g' file`: replace "foo" with "bar".
* `grep 'pattern' file`: search pattern in file.
* `grep -r 'pattern' dir`: recursive search.
* `sort file`: sort lines.
* `uniq file`: filter unique lines.
* `wc -l file`: count lines.
* `diff file1 file2`: show differences.
* `cmp file1 file2`: byte-by-byte compare.
* `tee file`: split output to terminal + file.

---

## 🔧 9️⃣ Scripting, Shell, Automation

* `bash script.sh`: run Bash script.
* `sh script.sh`: run shell script.
* `source script.sh`: run in current shell.
* `. script.sh`: same as source.
* `alias ll='ls -alh'`: create command alias.
* `unalias ll`: remove alias.
* `export VAR=value`: set env variable.
* `env`: list env variables.
* `set`: show shell options.
* `unset VAR`: remove variable.
* `trap 'command' SIGINT`: handle signals.
* `cron`: schedule tasks.
* `at now + 5 minutes`: schedule one-time command.

---

## 🏗️ 🔟 Development, Debugging, Compilation

* `gcc file.c -o output`: compile C.
* `g++ file.cpp -o output`: compile C++.
* `make`: run Makefile.
* `cmake .`: generate build configs.
* `git clone repo`: clone repo.
* `git pull`: fetch + merge.
* `git push`: push commits.
* `diff file1 file2`: show file diffs.
* `patch < patchfile`: apply patch.
* `strace ./program`: trace system calls.
* `ltrace ./program`: trace library calls.
* `gdb ./program`: debug program.
* `valgrind ./program`: check memory.

---

## 🌍 1️⃣1️⃣ Containers, Virtualization

* `docker ps`: list containers.
* `docker images`: list images.
* `docker run -d image`: run detached container.
* `docker exec -it id bash`: open shell inside container.
* `docker logs id`: view logs.
* `docker-compose up -d`: launch multi-container app.
* `podman ps`: list podman containers.
* `vagrant up`: start VM.
* `vagrant halt`: stop VM.
* `virsh list`: list virtual machines.
* `qemu-img`: manage VM images.


## 🔐 1️⃣2️⃣ Advanced Security Tools

* `sestatus`: check SELinux status.
* `setenforce 1|0`: enable or disable SELinux enforcing mode.
* `semanage fcontext`: manage SELinux file contexts.
* `restorecon -Rv /path`: restore SELinux context on files.
* `aa-status`: check AppArmor profiles status.
* `aa-enforce profile`: enforce AppArmor profile.
* `aa-complain profile`: switch AppArmor to complain mode.
* `iptables -A INPUT -p tcp --dport 22 -j ACCEPT`: allow SSH traffic.
* `ufw enable`: enable uncomplicated firewall.
* `ufw allow 80/tcp`: allow HTTP traffic.
* `fail2ban-client status`: show banned IPs.

---

## ⚙️ 1️⃣3️⃣ Performance and Benchmarking

* `top`: real-time system usage.
* `htop`: interactive system monitor.
* `vmstat 1`: system performance snapshot.
* `iostat 1`: I/O stats.
* `sar -u 1 5`: CPU usage report.
* `mpstat`: per-CPU usage.
* `perf stat command`: performance counter.
* `time command`: measure command execution time.
* `fio`: disk benchmarking tool.
* `stress --cpu 4`: stress test CPU.

---

## 🌐 1️⃣4️⃣ Advanced Networking Tools

* `netcat -lvp 4444`: start TCP listener on port 4444.
* `nc host 80`: connect to remote port 80.
* `socat TCP4-LISTEN:4444,fork EXEC:/bin/bash`: advanced relay.
* `tcpdump -i eth0 port 80`: sniff HTTP traffic.
* `nmap -sV host`: scan services on a host.
* `traceroute host`: trace network route.
* `mtr host`: combine ping and traceroute.
* `iperf3 -s`: start performance server.
* `iperf3 -c host`: run client test.
* `ethtool eth0`: show NIC info.

---

## 🛠️ 1️⃣5️⃣ Kernel Tuning and System Internals

* `sysctl -a`: list kernel parameters.
* `sysctl vm.swappiness=10`: set swappiness.
* `cat /proc/cpuinfo`: CPU details.
* `cat /proc/meminfo`: memory info.
* `dmesg`: kernel ring buffer.
* `lsmod`: list loaded kernel modules.
* `modprobe module`: load kernel module.
* `rmmod module`: remove kernel module.
* `uptime`: system uptime.
* `uname -r`: show kernel version.

---

## 💻 1️⃣6️⃣ Hardware Management

* `lscpu`: show CPU details.
* `lsblk`: show block devices.
* `lsusb`: show USB devices.
* `lspci`: show PCI devices.
* `smartctl -a /dev/sdX`: check disk health.
* `hdparm -I /dev/sdX`: display disk parameters.
* `sensors`: read hardware sensors.
* `dmidecode`: display hardware info.
* `inxi -Fx`: detailed system summary.

---

## ☁️ 1️⃣7️⃣ Cloud CLI Tools

* `aws configure`: set AWS credentials.
* `aws s3 ls`: list S3 buckets.
* `aws ec2 describe-instances`: list EC2 instances.
* `az login`: Azure CLI login.
* `az vm list`: list Azure VMs.
* `gcloud auth login`: Google Cloud CLI login.
* `gcloud compute instances list`: list GCP instances.
* `terraform init`: initialize Terraform.
* `terraform apply`: apply Terraform configs.
* `kubectl get pods`: list Kubernetes pods.


## 🛠️ 1️⃣8️⃣ DevOps Tools (Ansible, Jenkins, GitLab)

### Ansible

* `ansible --version`: check Ansible version.
* `ansible all -m ping`: ping all hosts.
* `ansible-playbook site.yml`: run a playbook.
* `ansible-galaxy install role`: install a role.
* `ansible-inventory --list`: display inventory.

### Jenkins

* `java -jar jenkins.war`: run Jenkins manually.
* `jenkins-cli.jar -s http://localhost:8080 list-jobs`: list Jenkins jobs.
* `jenkins-cli.jar -s http://localhost:8080 build job-name`: trigger a build.
* `jenkins-cli.jar -s http://localhost:8080 install-plugin plugin-name`: install Jenkins plugin.

### GitLab CI

* `gitlab-runner register`: register a runner.
* `gitlab-runner start`: start GitLab runner.
* `gitlab-runner status`: check runner status.
* `gitlab-runner exec shell job`: run a job locally.
* `.gitlab-ci.yml`: define GitLab CI pipeline config.

---

## 🔧 1️⃣9️⃣ Advanced CLI Utilities

### `jq`

* `jq . file.json`: pretty-print JSON.
* `jq '.key' file.json`: extract a key.
* `jq 'map(select(.active == true))' file.json`: filter JSON.

### `yq`

* `yq e '.key' file.yaml`: extract YAML key.
* `yq e '.items[] | select(.enabled == true)' file.yaml`: filter YAML.

### `fzf`

* `fzf`: fuzzy search files interactively.
* `history | fzf`: fuzzy search command history.
* `git log --oneline | fzf`: fuzzy search Git commits.

---

## 🎨 2️⃣0️⃣ Image, Audio, Video Tools

* `imagemagick convert input.jpg -resize 50% output.jpg`: resize image.
* `ffmpeg -i input.mp4 -vf scale=640:480 output.mp4`: resize video.
* `ffmpeg -i input.mp3 output.wav`: convert audio.
* `sox input.wav output.mp3`: convert audio format.
* `mediainfo file.mp4`: display media metadata.

---

## 🎉 2️⃣1️⃣ Fun and Useful Extras

* `fortune`: show random quote.
* `cowsay "hello"`: make a talking cow.
* `sl`: steam locomotive animation (fun typo of `ls`).
* `toilet text`: display large ASCII text.
* `figlet text`: generate large ASCII letters.
* `rev`: reverse input text.
* `yes "text"`: repeat text endlessly.
* `cal`: display a calendar.
* `bc`: command-line calculator.
* `factor 42`: show prime factors of a number.


## 🔍 2️⃣2️⃣ Searching, Finding Files, and Viewing Content

### `find`

* **Description:** Recursively search for files and directories.
* **Basic Usage:** `find /path -name "*.txt"`
* **Common Options:**

  * `-type f`: only files
  * `-type d`: only directories
  * `-size +10M`: larger than 10 MB
  * `-mtime -1`: modified within last day
* **Example:** `find /var/log -type f -name "*.log" -mtime -7`

### `locate`

* **Description:** Fast file search using a prebuilt index.
* **Usage:** `locate filename`
* **Example:** `locate nginx.conf`
* **Note:** Run `updatedb` to refresh the index.

### `grep`

* **Description:** Search for patterns in files.
* **Basic Usage:** `grep 'pattern' file`
* **Common Options:**

  * `-i`: ignore case
  * `-r`: recursive search
  * `-n`: show line numbers
* **Example:** `grep -ri 'error' /var/log/`

### `ack` / `ag` (The Silver Searcher)

* **Description:** Faster recursive code search.
* **Usage:** `ag pattern`
* **Example:** `ag TODO src/`

### `tail`

* **Description:** View the end of a file.
* **Basic Usage:** `tail file`
* **Common Options:**

  * `-n 20`: show last 20 lines
  * `-f`: follow file updates live
* **Example:** `tail -f /var/log/syslog`

### `head`

* **Description:** View the start of a file.
* **Usage:** `head file`
* **Example:** `head -n 50 largefile.txt`

### `cat`

* **Description:** Concatenate and display file contents.
* **Usage:** `cat file`
* **Example:** `cat file1 file2 > combined.txt`

### `more`

* **Description:** Paginate text output (basic viewer).
* **Usage:** `more file`
* **How to Use:** Space to scroll down, `q` to quit.

### `less`

* **Description:** Advanced pager for viewing files interactively.
* **Usage:** `less file`
* **How to Use:** Arrow keys or space to scroll, `/pattern` to search.
* **Example:** `less /var/log/syslog`

### `stat`

* **Description:** Display detailed file information.
* **Usage:** `stat file`
* **Example:** `stat /etc/passwd`

### `wc`

* **Description:** Count lines, words, and bytes in a file.
* **Usage:** `wc file`
* **Example:** `wc -l file` (count lines)


## 📦 2️⃣3️⃣ Installation and Package Management Commands

### Debian/Ubuntu (`apt` & `.deb`)

* `sudo apt update`: update package list.
* `sudo apt upgrade`: upgrade all installed packages.
* `sudo apt install package`: install a package.
* `sudo apt remove package`: remove a package.
* `sudo apt autoremove`: remove unused dependencies.
* `dpkg -i package.deb`: install a `.deb` package manually.
* `dpkg -r package`: remove a `.deb` package manually.
* `apt-cache search keyword`: search for packages.
* **Example:** `sudo apt install nginx`

### Red Hat/CentOS/Fedora (`yum`, `dnf` & `.rpm`)

* `sudo yum install package`: install using yum.
* `sudo dnf install package`: install using dnf (Fedora/RHEL 8+).
* `sudo yum remove package`: remove using yum.
* `sudo dnf remove package`: remove using dnf.
* `rpm -ivh package.rpm`: install `.rpm` package.
* `rpm -Uvh package.rpm`: upgrade `.rpm` package.
* `rpm -qa | grep name`: query installed packages.
* **Example:** `sudo dnf install httpd`

### Arch Linux (`pacman`)

* `sudo pacman -Syu`: update system.
* `sudo pacman -S package`: install package.
* `sudo pacman -R package`: remove package.
* `pacman -Ss keyword`: search for package.
* **Example:** `sudo pacman -S firefox`

### Universal Package Systems

* `snap install package`: install Snap package.
* `snap remove package`: remove Snap package.
* `flatpak install remote package`: install Flatpak app.
* `flatpak uninstall package`: remove Flatpak app.

### Source Code (`tar` and Manual Compile)

* `tar -xvf archive.tar`: extract `.tar` archive.
* `tar -xzvf archive.tar.gz`: extract `.tar.gz` archive.
* `tar -xjvf archive.tar.bz2`: extract `.tar.bz2` archive.
* `./configure`: prepare build system (inside source folder).
* `make`: compile the program.
* `sudo make install`: install the compiled program.
* **Example:**

  ```bash
  tar -xzvf app.tar.gz
  cd app/
  ./configure
  make
  sudo make install
  ```

### Python/Node/Rust Package Managers

* `pip install package`: install Python package.
* `pip uninstall package`: remove Python package.
* `npm install package`: install Node.js package.
* `npm uninstall package`: remove Node.js package.
* `cargo install package`: install Rust package.
* **Example:** `pip install requests`


## 🧹 2️⃣4️⃣ Cache, Buffer, and Memory Clearing Commands

### Clearing Page Cache, Dentries, and Inodes

* `sudo sync`: flush filesystem buffers to disk (writes dirty pages).
* `sudo echo 1 > /proc/sys/vm/drop_caches`: clear page cache only.
* `sudo echo 2 > /proc/sys/vm/drop_caches`: clear dentries and inodes.
* `sudo echo 3 > /proc/sys/vm/drop_caches`: clear page cache, dentries, and inodes.
* **Example:**

  ```bash
  sudo sync
  sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'
  ```
* **Explanation:** This helps free cached memory, but does not free used (active) memory.

### Freeing Swap Memory

* `sudo swapoff -a && sudo swapon -a`: disable and re-enable swap to clear it.
* **Example:**

  ```bash
  sudo swapoff -a
  sudo swapon -a
  ```
* **Explanation:** Forces the system to flush swap memory back to RAM.

### Checking Free Memory

* `free -h`: show human-readable memory and swap usage.
* `vmstat 1`: live memory, swap, IO stats.
* `top` or `htop`: interactive live view.
* `cat /proc/meminfo`: detailed memory stats.

### Clearing Apt/Yum/DNF Caches

* `sudo apt clean`: remove downloaded `.deb` package files.
* `sudo apt autoclean`: remove outdated cached `.deb` packages.
* `sudo dnf clean all`: clean all DNF cached data.
* `sudo yum clean all`: clean all Yum cached data.

### Clearing Logs and Journals

* `sudo journalctl --vacuum-size=100M`: shrink journal logs to under 100 MB.
* `sudo journalctl --vacuum-time=7d`: remove logs older than 7 days.
* `sudo truncate -s 0 /var/log/*.log`: manually zero out log files.

### Clearing Temporary Files

* `sudo rm -rf /tmp/*`: delete everything in `/tmp`.
* `sudo rm -rf /var/tmp/*`: delete everything in `/var/tmp`.
* `sudo tmpwatch 12 /tmp`: delete files not accessed in 12 hours (if available).


## 💾 2️⃣5️⃣ Storage, Mount, Unmount, Media, and Related Commands

### Checking Disk and Storage Information

* `lsblk`: list block devices and partitions.
* `blkid`: show block device UUIDs and types.
* `fdisk -l`: list disk partitions (for MBR disks).
* `parted -l`: list partitions (for both MBR/GPT disks).
* `df -h`: show mounted filesystem disk usage (human-readable).
* `du -sh /path`: show total disk usage of a directory.
* `mount`: list mounted filesystems.
* `findmnt`: display target mount points.

### Mounting Filesystems

* `sudo mount /dev/sdX1 /mnt`: mount a device partition.
* `sudo mount -t vfat /dev/sdX1 /mnt`: mount specifying filesystem type (e.g., FAT32).
* `sudo mount -o loop file.iso /mnt`: mount ISO or image file as loop device.
* **Example:**

  ```bash
  sudo mount /dev/sdb1 /media/usb
  ```

### Unmounting Filesystems

* `sudo umount /mnt`: unmount a device.
* `sudo umount /media/usb`: unmount a USB device.
* **Tip:** Make sure the device isn’t in use or locked by a process (use `lsof` or `fuser`).

### Creating Filesystems

* `mkfs.ext4 /dev/sdX1`: create ext4 filesystem.
* `mkfs.vfat /dev/sdX1`: create FAT32 filesystem.
* `mkfs.ntfs /dev/sdX1`: create NTFS filesystem.
* `mkfs.xfs /dev/sdX1`: create XFS filesystem.
* **Caution:** This will erase all data on the partition.

### Checking and Repairing Filesystems

* `fsck /dev/sdX1`: check and repair filesystem errors.
* `e2fsck -f /dev/sdX1`: force ext-based filesystem check.
* `xfs_repair /dev/sdX1`: repair XFS filesystem.

### Managing Disk Labels and UUIDs

* `e2label /dev/sdX1 label`: set ext filesystem label.
* `tune2fs -L label /dev/sdX1`: another way to set ext label.
* `blkid`: get UUIDs.
* `mount UUID=xxxx-xxxx /mnt`: mount using UUID.

### Working with USB and Removable Media

* `lsusb`: list USB devices.
* `udisksctl mount -b /dev/sdX1`: mount removable device (desktop-friendly).
* `udisksctl unmount -b /dev/sdX1`: unmount removable device.
* `udisksctl power-off -b /dev/sdX`: safely power off removable drive.

### Working with ISO and Image Files

* `dd if=/dev/sdX of=backup.img bs=4M`: create disk image.
* `dd if=backup.img of=/dev/sdX bs=4M`: restore disk image.
* `isoinfo -d -i file.iso`: view ISO metadata.
* `mount -o loop file.iso /mnt`: mount ISO image.


## 🔌 2️⃣6️⃣ Port Listening, Checking, and Process Management Commands

### Listing Open Ports and Listening Services

* `netstat -tuln`: show TCP/UDP ports that are listening.

  * `-t`: TCP
  * `-u`: UDP
  * `-l`: listening
  * `-n`: numeric output (no DNS resolve)
* `ss -tulwn`: modern alternative to `netstat` (faster, more detailed).
* `lsof -i`: list open internet (network) sockets.
* `lsof -i :80`: list processes using port 80.
* `nmap -sT localhost`: scan open TCP ports on local machine.

### Checking Process Information

* `ps aux`: list all processes with details.
* `top`: real-time process viewer.
* `htop`: enhanced interactive process viewer.
* `pgrep process_name`: get PID(s) for a process by name.
* `pidof process_name`: get the PID for a specific program.

### Killing Processes

* `kill PID`: gracefully stop a process.
* `kill -9 PID`: forcefully terminate a process (SIGKILL).
* `killall process_name`: kill all processes matching the name.
* `pkill pattern`: kill processes by matching name or pattern.
* **Example:** `killall nginx`

### Checking Which Process Uses a Port

* `lsof -i :PORT`: show process using a specific port.

  * Example: `lsof -i :8080`
* `netstat -tulpn | grep :PORT`: find PID and process on port.

  * Example: `netstat -tulpn | grep :22`
* `ss -tulpn | grep :PORT`: same with `ss`.

### Stopping a Service That Binds a Port

* `systemctl stop service`: stop systemd service.
* `service service stop`: stop SysVinit service.
* Example: `sudo systemctl stop apache2`

### Freeing Up a Busy Port (Advanced)

* Find the PID: `lsof -i :PORT`
* Kill the PID: `sudo kill -9 PID`
* Restart the service if needed: `sudo systemctl restart service`

### Monitor Connections

* `watch ss -s`: watch summary of socket connections live.
* `netstat -anp`: show all network connections with PID/program.
* `iftop`: live bandwidth usage by connection (requires installation).
* `nethogs`: show bandwidth usage per process (requires installation).

### Example Full Workflow

```bash
# Check what’s using port 8080
sudo lsof -i :8080

# Kill the process
sudo kill -9 PID

# Verify the port is free
sudo ss -tulwn | grep :8080
```


## 🌐 2️⃣7️⃣ Telnet, Ping, Curl, and Networking/DNS/Domain Commands

### `ping`

* **Description:** Check network reachability to a host.
* **Usage:** `ping host`
* **Common Options:**

  * `-c N`: stop after N pings
  * `-i SEC`: interval between pings
* **Example:** `ping -c 4 google.com`

### `telnet`

* **Description:** Connect to a host and port (for testing plain TCP connections).
* **Usage:** `telnet host port`
* **Example:** `telnet google.com 80`
* **Tip:** Used to check if a remote port is open.

### `nc` (Netcat)

* **Description:** Versatile networking tool for port scanning, listening, data transfer.
* **Usage:**

  * Check port: `nc -zv host port`
  * Listen on port: `nc -l port`
  * Transfer file: `nc -l port > file`
* **Example:** `nc -zv 192.168.1.1 22`

### `curl`

* **Description:** Transfer data from or to a server.
* **Usage:** `curl [options] URL`
* **Common Options:**

  * `-I`: fetch headers only
  * `-O`: save file with original name
  * `-d`: send POST data
* **Example:** `curl -I https://example.com`

### `wget`

* **Description:** Non-interactive network downloader.
* **Usage:** `wget URL`
* **Example:** `wget https://example.com/file.zip`

### `dig`

* **Description:** DNS lookup utility.
* **Usage:** `dig domain`
* **Common Queries:**

  * `dig A domain`: get IPv4 address
  * `dig MX domain`: get mail exchange servers
  * `dig NS domain`: get name servers
* **Example:** `dig google.com`

### `nslookup`

* **Description:** Query DNS records interactively.
* **Usage:** `nslookup domain`
* **Example:** `nslookup google.com`

### `host`

* **Description:** Simple DNS lookup.
* **Usage:** `host domain`
* **Example:** `host google.com`

### `traceroute`

* **Description:** Trace route packets take to a destination.
* **Usage:** `traceroute host`
* **Example:** `traceroute google.com`

### `mtr`

* **Description:** Combine ping and traceroute in one live tool.
* **Usage:** `mtr host`
* **Example:** `mtr google.com`

### `arp`

* **Description:** View and manipulate ARP table.
* **Usage:** `arp -n`

### `ip route`

* **Description:** Show current routing table.
* **Usage:** `ip route show`

### `ip neigh`

* **Description:** Show neighbor (ARP) table.
* **Usage:** `ip neigh show`


## 💾 2️⃣8️⃣ Advanced Backup and Restore Tools

### `tar`

* **Description:** Archive files/directories, optionally compress.
* **Usage:**

  * Create: `tar -czvf archive.tar.gz folder/`
  * Extract: `tar -xzvf archive.tar.gz`
* **Common Options:**

  * `-c`: create archive
  * `-x`: extract
  * `-z`: gzip compress
  * `-v`: verbose
  * `-f`: file name
* **Example:** `tar -czvf mybackup.tar.gz /var/www`

### `dd`

* **Description:** Low-level copy of entire disks or partitions.
* **Usage:** `dd if=/dev/sdX of=backup.img bs=4M`
* **Common Options:**

  * `if=`: input file/device
  * `of=`: output file/device
  * `bs=`: block size
* **Example:** `dd if=/dev/sda of=/mnt/backup/sda.img bs=4M`

### `rsnapshot`

* **Description:** Automated, incremental backup tool.
* **Usage:** Configured via `/etc/rsnapshot.conf`, run with `rsnapshot hourly` / `daily`.

### `borgbackup`

* **Description:** Deduplicating backup with encryption and compression.
* **Usage:** `borg init repo; borg create repo::archive /data`

### `restic`

* **Description:** Fast, secure, and efficient backup program.
* **Usage:** `restic -r /repo backup /path`

---

## 🔧 2️⃣9️⃣ Git and Version Control Commands

### `git`

* **Description:** Distributed version control system.
* **Common Commands:**

  * `git init`: initialize a repo
  * `git clone URL`: clone remote repo
  * `git add file`: stage changes
  * `git commit -m "msg"`: commit changes
  * `git push`: push to remote
  * `git pull`: fetch + merge
  * `git status`: show current state
  * `git log`: view commit history
* **Example:**

  ```bash
  git clone https://github.com/user/repo.git
  cd repo
  git add .
  git commit -m "Initial commit"
  git push origin main
  ```

### `svn`

* **Description:** Subversion (centralized version control).
* **Common Commands:**

  * `svn checkout URL`: check out repo
  * `svn commit -m "msg"`: commit changes
  * `svn update`: update local copy

---

## 🔐 3️⃣0️⃣ Firewall and Security Commands

### `ufw` (Uncomplicated Firewall)

* **Description:** Simple firewall frontend for iptables.
* **Usage:**

  * Enable: `sudo ufw enable`
  * Allow port: `sudo ufw allow 22`
  * Deny port: `sudo ufw deny 80`
  * Check status: `sudo ufw status`

### `iptables`

* **Description:** Advanced packet filtering and firewall.
* **Usage:**

  * List rules: `sudo iptables -L -n -v`
  * Allow port: `sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT`
  * Block IP: `sudo iptables -A INPUT -s 1.2.3.4 -j DROP`

### `fail2ban`

* **Description:** Ban IPs after too many failed login attempts.
* **Usage:**

  * Check status: `sudo fail2ban-client status`
  * Unban IP: `sudo fail2ban-client set jailname unbanip 1.2.3.4`

### `selinux`

* **Description:** Enforce mandatory access control policies.
* **Usage:**

  * Check status: `sestatus`
  * Enable/disable: `setenforce 1|0`

### `apparmor`

* **Description:** Profile-based mandatory access control.
* **Usage:**

  * Check status: `sudo aa-status`
  * Switch mode: `sudo aa-enforce /path/to/program`


## 🐳 3️⃣1️⃣ Containerization Tools (Docker, Podman, Docker Swarm)

### `docker`

* **Description:** Popular container platform.
* **Basic Commands:**

  * `docker ps`: list running containers.
  * `docker images`: list local images.
  * `docker pull image`: download image.
  * `docker run image`: run a container.
  * `docker run -d -p 8080:80 image`: run in detached mode, map ports.
  * `docker exec -it container bash`: open shell inside container.
  * `docker logs container`: view logs.
  * `docker stop container`: stop container.
  * `docker rm container`: remove container.
* **Example:** `docker run -d -p 8080:80 nginx`

### `docker-compose`

* **Description:** Define and run multi-container Docker apps.
* **Commands:**

  * `docker-compose up -d`: start services.
  * `docker-compose down`: stop services.
  * `docker-compose logs`: view service logs.
  * `docker-compose build`: build services.

### `docker swarm`

* **Description:** Native clustering/orchestration for Docker.
* **Commands:**

  * `docker swarm init`: initialize swarm.
  * `docker node ls`: list swarm nodes.
  * `docker service create`: deploy service.
  * `docker service ls`: list services.

### `podman`

* **Description:** Docker-compatible container engine (rootless).
* **Commands:**

  * `podman ps`: list containers.
  * `podman run image`: run container.
  * `podman build -t name .`: build image.
  * `podman logs container`: view logs.

---

## 🖥️ 3️⃣2️⃣ Virtualization Tools (KVM, VirtualBox)

### KVM/QEMU

* **Description:** Kernel-based virtualization.
* **Commands:**

  * `virsh list --all`: list VMs.
  * `virsh start vmname`: start VM.
  * `virsh shutdown vmname`: shutdown VM.
  * `virt-install`: create new VM.
  * `virt-manager`: GUI for managing VMs.

### VirtualBox

* **Description:** Cross-platform virtualization software.
* **Commands:**

  * `VBoxManage list vms`: list VMs.
  * `VBoxManage startvm "vmname" --type headless`: start VM.
  * `VBoxManage controlvm "vmname" poweroff`: power off VM.
  * `VBoxManage snapshot "vmname" take snapname`: take snapshot.
  * `VBoxManage showvminfo "vmname"`: show VM details.

---

## 🌐 3️⃣3️⃣ Web Servers, Certificates, and SSH Tools

### Nginx

* **Description:** High-performance web server.
* **Commands:**

  * `sudo systemctl start nginx`: start Nginx.
  * `sudo systemctl stop nginx`: stop Nginx.
  * `sudo systemctl reload nginx`: reload configuration.
  * `nginx -t`: test configuration.
  * `nginx -s reload`: reload from command line.

### Apache2

* **Description:** Popular open-source web server.
* **Commands:**

  * `sudo systemctl start apache2`: start Apache.
  * `sudo systemctl stop apache2`: stop Apache.
  * `sudo systemctl reload apache2`: reload configuration.
  * `apachectl configtest`: test configuration.
  * `apache2ctl -S`: show virtual host setup.

### Certbot (Let's Encrypt)

* **Description:** Obtain free SSL certificates.
* **Commands:**

  * `sudo certbot --nginx`: install certificate for Nginx.
  * `sudo certbot --apache`: install certificate for Apache.
  * `sudo certbot renew --dry-run`: test renewal.
  * `sudo certbot certificates`: list certificates.

### OpenSSL

* **Description:** Toolkit for SSL/TLS operations.
* **Commands:**

  * `openssl version`: check OpenSSL version.
  * `openssl req -new -x509 -days 365 -key server.key -out server.crt`: create self-signed certificate.
  * `openssl genrsa -out key.pem 2048`: generate RSA private key.
  * `openssl rsa -in key.pem -pubout > pubkey.pem`: extract public key.

### SSH Key Generation

* **Description:** Create SSH keys for secure login.
* **Commands:**

  * `ssh-keygen -t rsa -b 4096 -C "email@example.com"`: generate RSA SSH key.
  * `ssh-add ~/.ssh/id_rsa`: add key to SSH agent.
  * `ssh-copy-id user@host`: copy public key to remote server.
  * `ssh user@host`: connect via SSH.

