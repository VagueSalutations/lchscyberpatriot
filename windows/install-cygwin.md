# install cygwin

## set bridged networking in vmware fusion
* In VMware Fusion (but not inside the VM)
	* type `Command-E`
	* choose "Network Adapter"
	* choose Bridged Networking - Autodetect
* Choose 'Work' network when prompted in image

## open powershell (no need admin)

Start Menu...type Powershell...choose `Windows PowerShell` from the list

Copy the text below, right-click your PowerShell window, and hit `enter`

```
cd c:\Users\Public
$client = new-object System.Net.WebClient
$client.DownloadFile( "http://cygwin.org/setup-x86.exe", "c:\Users\Public\setup-x86.exe" )
```

## open command prompt as administrator

Start Menu...type Command Prompt...right-click `Command Prompt` in list and choose `Run as administrator`

Copy the text below, right-click the Command Prompt window, and choose `Paste`

```
cd c:\Users\Public
edit runme.cmd
```

Copy the text below, right-click the Command Prompt window , save, and exit:

```
setup-x86.exe ^
--quiet-mode ^
--site http://mirrors.kernel.org/sourceware/cygwin/ ^
--root c:\cygwin ^
--packages ^
openssh, wget, perl, python, curl, rsync, git
```

Run the runme.cmd

```
runme.cmd
```

## edit cygwin.bat file

```
edit c:\cygwin\cygwin.bat
```

Add before final bash line, save, and exit:

```
set CYGWIN=binmode ntsec
```

# start cygwin terminal as administrator

## configure sshd

```
$ ssh-host-config

*** Info: Generating missing SSH host keys
ssh-keygen: generating new host keys: RSA DSA ECDSA ED25519
*** Info: Creating default /etc/ssh_config file
*** Info: Creating default /etc/sshd_config file

*** Info: StrictModes is set to 'yes' by default.
*** Info: This is the recommended setting, but it requires that the POSIX
*** Info: permissions of the user's home directory, the user's .ssh
*** Info: directory, and the user's ssh key files are tight so that
*** Info: only the user has write permissions.
*** Info: On the other hand, StrictModes don't work well with default
*** Info: Windows permissions of a home directory mounted with the
*** Info: 'noacl' option, and they don't work at all if the home
*** Info: directory is on a FAT or FAT32 partition.
*** Query: Should StrictModes be used? (yes/no) yes

*** Info: Privilege separation is set to 'sandbox' by default since
*** Info: OpenSSH 6.1.  This is unsupported by Cygwin and has to be set
*** Info: to 'yes' or 'no'.
*** Info: However, using privilege separation requires a non-privileged account
*** Info: called 'sshd'.
*** Info: For more info on privilege separation read /usr/share/doc/openssh/README.privsep.
*** Query: Should privilege separation be used? (yes/no) yes
*** Info: Note that creating a new user requires that the current account have
*** Info: Administrator privileges.  Should this script attempt to create a
*** Query: new local account 'sshd'? (yes/no) yes
*** Info: Updating /etc/sshd_config file

*** Query: Do you want to install sshd as a service?
*** Query: (Say "no" if it is already installed as a service) (yes/no) yes
*** Query: Enter the value of CYGWIN for the daemon: [] binmode ntsec
*** Info: On Windows Server 2003, Windows Vista, and above, the
*** Info: SYSTEM account cannot setuid to other users -- a capability
*** Info: sshd requires.  You need to have or to create a privileged
*** Info: account.  This script will help you do so.

*** Info: It's not possible to use the LocalSystem account for services
*** Info: that can change the user id without an explicit password
*** Info: (such as passwordless logins [e.g. public key authentication]
*** Info: via sshd) when having to create the user token from scratch.
*** Info: For more information on this requirement, see
*** Info: https://cygwin.com/cygwin-ug-net/ntsec.html#ntsec-nopasswd1

*** Info: If you want to enable that functionality, it's required to create
*** Info: a new account with special privileges (unless such an account
*** Info: already exists). This account is then used to run these special
*** Info: servers.

*** Info: Note that creating a new user requires that the current account
*** Info: have Administrator privileges itself.

*** Info: No privileged account could be found.

*** Info: This script plans to use 'cyg_server'.
*** Info: 'cyg_server' will only be used by registered services.
*** Query: Do you want to use a different name? (yes/no) no
*** Query: Create new privileged user account 'WIN-TVOA4G8I3DH\cyg_server' (Cygwin name: 'cyg_server')? (yes/no) yes
*** Info: Please enter a password for new user cyg_server.  Please be sure
*** Info: that this password matches the password rules given on your system.
*** Info: Entering no password will exit the configuration.
*** Query: Please enter the password: Passw0rd!
*** Query: Reenter: Passw0rd!

*** Info: User 'cyg_server' has been created with password 'Passw0rd!'.
*** Info: If you change the password, please remember also to change the
*** Info: password for the installed services which use (or will soon use)
*** Info: the 'cyg_server' account.


*** Info: The sshd service has been installed under the 'cyg_server'
*** Info: account.  To start the service now, call `net start sshd' or
*** Info: `cygrunsrv -S sshd'.  Otherwise, it will start automatically
*** Info: after the next reboot.

*** Info: Host configuration finished. Have fun!
```

## start sshd server
```
cygrunsrv -S sshd
```

## open firewall
```
netsh advfirewall firewall add rule name="sshd" dir=in action=allow protocol=TCP localport=22
```

## test local ssh
```
ssh cyg_server@localhost
# enter 'Passw0rd!' when prompted
```	
