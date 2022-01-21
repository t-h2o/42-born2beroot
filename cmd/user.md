# Users


## Tools need

A librairy for password rules

```sudo apt-get install libpam-pwquality```


## web documentation

[linux config](https://linuxconfig.org/linux-reset-password-expiration-age-and-history)

[pam-pwquality](https://man.archlinux.org/man/pam_pwquality.8)


## main command

read this manual

```chage```

```adduser```

```deluser```

```passwd```


## Set password rules ans policies

* expiration after 30 days
* cannot rechange password before 2 days
* password is 10 caracters, 1 uppercase, 1 digit 
* no 3 carater follow
* no user name in the password
* just for normal user, need 7 caraters not in the last password


## expiration after 30 days

To set maximum number of days between password change to existing users

```$ sudo chage -M <days> <username>```


## minimum days between password change

```To set minimum number of days between password change```

$ sudo chage -m <days> <username>


## password is 10 caracters, 1 uppercase, 1 digit 

edit rules password

```sudo vim /etc/pam.d/common-password```

```bash
# minimum lenght is 10 character
minlen=10

# minimum one uppercase
ucredit=-1	

# minimum one lowerercase
lcredit=-1	

# minimum one digit
dcredit=-1

# minimum one special charater 
ocredit=-1
```
