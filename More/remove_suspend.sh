sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target # disable suspend and other mode
sudo systemctl status sleep.target suspend.target hibernate.target hybrid-sleep.target # show the status
# sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target # re-enable the modes
