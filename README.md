# Born 2 be root

## Objectif

* no graphic interface
* OS debian or CentOS
* AppArmor
* Create two crypt partition
* SSH service on port 4242
* not allow root whit SSH
* use the firewall UFW
* let open only the 4242 port
* the hostname machine is [login]42
* set password rules
	* expiration after 30 days
	* cannot rechange password before 2 days
	* password is 10 caracters, 1 uppercase, 1 digit and no 3 carater follow
	* cannot put the user name in the password
	* just for normal user, need 7 caraters not in the last password 
* install and set sudo with good practice
	* Only 3 try to log whith sudo
	* erro message after a bad try
	* log input and output sudo in /var/log/sudo/
	* mode TTY will be active for security
	* Not allow paths
		* /usr/local/sbin
		* /usr/local/bin
		* /usr/sbin
		* /usr/bin
		* /sbin
		* /bin
		* /snap/bin
* Create script monitoring.sh in bash
	* Every 10 minutes, display on all terminals


## Architecture

In a linux terminal, you can ask with ```uname --all``` system information.
with ```uname -p```, uname will print your processor.
In my case, uname print ```x84_64```. I find what does mean 
[```x84_64```](https://en.wikipedia.org/wiki/X86-64).
x84_64 is a synonyme of AMD64.


## Dowload iso of debian

[Debian](https://www.debian.org/)
, amazing free os...
you can
[download](https://www.debian.org/releases/stable/)
from this page, your architecture version.
In my case, I'll choose the "64-bit PC (amd64)"

Mmm...
Perhaps here for [download](https://www.debian.org/releases/stable/debian-installer/)
