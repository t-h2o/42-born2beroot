 ######  #    # #          ##        #
##     # #    # #          #   ##    #
##     # #    # ######    ##    ### ##
 ####### #    # #    #    #####   ###
 ##   ## #    # #    #    #   ##  #
  #    # ##   # #    #   ##  ### ##  ########### # #####
  #    #  ##### #    #   #####   #        #      #     #
#####################################     #      #    ##
#                                   #     #      ##### #
# Auto-config for born2beroot       #    ##     ###    #
#                                   #   ###    ###     #
##################################### #####    #########





#####################################
#                                   #
#	Setting variable                #
#                                   #
#####################################



username=tgrivel





#####################################
#                                   #
#	Install package					#
#                                   #
#####################################


	
apt update			# update the package manager

apt upgrade			# upgrade package

apt install sudo	# install super-user do

apt install ufw		# install the firewall





#####################################
#                                   #
#	Set sudo setting				#
#                                   #
#####################################


	
# sudo setting
	# folder for the log file
mkdir /var/log/sudo
touch /var/log/sudo/log_input_output_sudo
cp sudo_config /etc/sudoers.d/


# SSH
apt install openssh-server
mv /etc/ssh/sshd_config /etc/ssh/sshd_config.bk
cp sshd_config /etc/ssh/sshd_config

# enable the firewall	
ufw enable


# user management
mv /etc/login.defs /etc/login.defs.bk
cp login.defs /etc/login.defs


# password policy
apt install libpam-pwquality


# cron
crontab -u root -e
23 */10 * * * * sh /path/to/script

