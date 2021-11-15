# Users

## links

[linux config](https://linuxconfig.org/linux-reset-password-expiration-age-and-history)


## main command

read this manual

```chage```

```adduser```

```deluser```

```passwd```


## Set password rules ans policies

* expiration after 30 days
* cannot rechange password before 2 days
* password is 10 caracters, 1 uppercase, 1 digit and no 3 carater follow
* cannot put the user name in the password
* just for normal user, need 7 caraters not in the last password


## Add user

```sudo adduser pol```


## Password rules and policies

A librairy for password rules

```sudo apt-get install libpam-pwquality```

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
