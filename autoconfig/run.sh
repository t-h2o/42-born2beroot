                       @@             
                       @@             
 m@*@@m  *@@@  *@@@  @@@@@@   m@@*@@m 
@@   @@    @@    @@    @@    @@*   *@@
 m@@@!@    !@    @@    @@    @@     @@
@!   !@    !@    @!    @!    @@     !@
 !!!!:!    !@    !!    !!    !@     !!
!!   :!    !!    !!    !!    !!!   !!!
:!: : !:   :: !: :!:   ::: :  : : : : 

                                  mmmm  mm           
                                m@* **  @@           
                                @@*                  
 m@@*@@   m@@*@@m *@@@@@@@@m   @@@@@  *@@@   m@*@@@@@
@@*  @@  @@*   *@@  @@    @@    @@      @@  m@@  @@  
@!       @@     @@  @!    @@    !@      !@  *!!@@@*  
@!m    m @@     !@  @!    !@    !@      !@  @!       
!!       !@     !!  !!    !!    !:      !!  *!!!!!*  
!:!    ! !!!   !!!  !!    !!    !:      !!  !:       
 : : :    : : : : : :::  :!: :: :::   : : :  : :!: : 
                                            ::     ::
                                            :::: ::  
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
# by tgrivel                        # #####    #########
#                                   #
#####################################



#####################################
#                                   #
#	Setting variable          		#
#                                   #
#####################################

port_ssh=4242
username=tgrivel

package+="sudo "				# Install super-user do
package+="ufw "					# Install firewall
package+="libpam-pwquality "	# Install password authentification manager password quality
package+="openssh-server "		# Install ssh server
package+="vim "					# Install text editor



#####################################
#                                   #
#	Install package					#
#                                   #
#####################################

apt update					# update the package manager
yes | apt upgrade			# upgrade package
yes | apt install $package	# install the list of package



#####################################
#                                   #
#	Set sudo setting				#
#                                   #
#####################################

echo ----------------------
echo sudo setting
echo ----------------------

mkdir /var/log/sudo									# create the folder will content the log file
touch /var/log/sudo/log_input_output_sudo			# create the log file
cp assets/sudo_config /etc/sudoers.d/sudo_config	# copy the sudo rules files in the good directories



#####################################
#                                   #
#	users							#
#                                   #
#####################################

addgroup user42
usermod -a -G user42 $username
# groups %usernamer



#####################################
#                                   #
#	SSH : secure shell				#
#                                   #
#####################################

mv -n /etc/ssh/sshd_config /etc/ssh/sshd_config.bk
cp assets/sshd_config /etc/ssh/sshd_config
usermod -a -G sudo $username



#####################################
#                                   #
#	UFW : firewall					#
#                                   #
#####################################

ufw enable										# enable the firewall
ufw allow $port_ssh/tcp comment 'service ssh'	# port 4242 for ssh
# yes | ufw delete 2	# delete the port ipv6


#####################################
#                                   #
#	User management					#
#                                   #
#####################################

mv -n /etc/login.defs /etc/login.defs.bk	# create a backup file of the original file
cp assets/login.defs /etc/login.defs 				# copy the config file



#####################################
#                                   #
#	pam								#
#                                   #
#####################################

mv -n /etc/pam.d/common-password /etc/pam.d/common-password.bk
cp assets/common-password /etc/pam.d/common-password



#####################################
#                                   #
#	Monitoring script				#
#                                   #
#####################################

chmod +x assets/monitoring.sh
cp assets/monitoring.sh /usr/local/bin/monitoring.sh
crontab assets/crontab_conf_tgrivel



#####################################
#                                   #
#	Display the informations		#
#                                   #
#	for connect to the server       #
#                                   #
#####################################

ip=`hostname -I`

echo to connect via ssh from other computer...
echo ----------------------
echo ssh $username@$ip -p $port_ssh
echo if you use a VM...
echo ssh localhost -p 4242
echo ----------------------



