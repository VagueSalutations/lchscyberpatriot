# lchscyberpatriot

Once you've cloned this in the windows box:

```
cp gitconfig ~/.gitconfig
```

# first things first
* Open up VM on "primary" laptop, and install cygwin
	- See: <https://github.com/VagueSalutations/lchscyberpatriot/blob/master/windows/install-cygwin.md>
	- Announce the ip address to everyone
		- `ipconfig -a`
* Everyone connects over ssh
	- `ssh cyg_server@ip-address`
* Everyone copies the README and Scored Questions locally
	- `scp cyg_server@ip-address:/cygdrive/c/Users/Desktop.../README* .`
	- `scp cyg_server@ip-address:/cygdrive/c/Users/Desktop.../Scored* .`

# doing the work
* assign someone to the scored questions
* assign someone to run the "always run" scripts
* assign someone to work on each "sometimes" scripts
* assign someone to dig for any manual stuff
	- add/remove programs + deleting files, etc - custom scripting

# tracking the work
* as things get fixed, and done, log your actions/activity on google drive so other people can see