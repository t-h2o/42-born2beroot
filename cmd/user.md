# Users

## Add user

```sudo adduser pol```


## Password rules and policies

```sudo apt-get install libpam-pwquality```

```cd /etc/pam.d```

```sudo vim common-password```

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
