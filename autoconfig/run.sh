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

adduser $username sudo						# Set the user in the sudo group
mkdir /var/log/sudo							# create the folder will content the log file
touch /var/log/sudo/log_input_output_sudo	# create the log file
cp assets/sudo_config /etc/sudoers.d/				# copy the sudo rules files in the good directories



#####################################
#                                   #
#	SSH : secure shell				#
#                                   #
#####################################

mv -n /etc/ssh/sshd_config /etc/ssh/sshd_config.bk
cp assets/sshd_config /etc/ssh/sshd_config



#####################################
#                                   #
#	UFW : firewall					#
#                                   #
#####################################

ufw enable										# enable the firewall
ufw allow $port_ssh/tcp comment 'service ssh'	# port 4242 for ssh



#####################################
#                                   #
#	User management					#
#                                   #
#####################################

mv -n /etc/login.defs /etc/login.defs.bk	# create a backup file of the original file
cp assets/login.defs /etc/login.defs 				# copy the config file



#####################################
#                                   #
#	Monitoring script				#
#                                   #
#####################################

mkdir -p /home/monitoring
cp assets/monitoring.sh /home/monitoring
crontab crontab_root_tgrivel
# crontab -u root -e
# 23 */10 * * * * sh /home/monitoring



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



