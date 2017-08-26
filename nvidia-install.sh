############################################################
# nvidia-install.sh : Script to install nvidia drivers     #
#                   : in Ubuntu.                           #
# Version           : 0.1                                  #
# Language          : bash 4.4.7                           #
# Platform          : MSI GE62 2QD, Core-i7, Ubuntu 17.04  #
# Kernel            : 4.10.0-32-generic                    #
# GCC Version       : 6.3.0 20170406 (Thread : posix)      #
############################################################
# Author            : Venkata Bharani Krishna Chekuri      #
# e-mail            : bharanikrishna7@gmail.com            #
############################################################

# INTRODUCTION
# ------------
# nvidia-install.sh script for Ubuntu will install Nvidia-384 driver along with primus, 
# bbswitch and Applet-Indicator. Some people dont prefer using bbswitch along with primus
# since they dont play well together, but I've tested this script and it works without any
# issues.
#
# bbswitch will allow GPU to be completely powered off when not in use, it'll save power 
# (useful for laptops). By default the Intel card will be in use, and user can switch card
# using the Applet-indicator. 
#
# TESTING ENVIRONMENT
# -------------------
# Language    - bash 4.4.7
# Platform    - MSI GE62 2QD, Core-i7, Ubuntu 17.04
# Kernel      - 4.10.0-32-generic
# GCC Version - 6.3.0 20170406 (Thread : posix)

######################
# Add necessary PPAs #
######################
sudo apt-add-repository ppa:graphics-drivers && sudo apt-add-repository ppa:nilarimogard/webupd8

#######################################################
# Usually not be required but if some errors pop-up   #
# add the below repository (manually if Ubuntu vers-  #
# -ion > 16.04)                                       #
#######################################################
# Note
# ----
# Bumblebee testing PPA is not supported for Ubuntu
# 16.04 and above (so manually add PPA to with signi-
# -ng key to source list)
sudo apt-add-repository bumblebee/testing

#######################
# Packages to Install #
#######################
# Note
# ----
# Latest Nvidia-Driver as of 08/26/2017 is nvidia-384 
# Modify the below value to latest version for best
# experience (usually new GPU are not supported by older
# drivers.
sudo apt-get update && sudo apt-get install nvidia-384 bumblebee-nvidia bbswitch-dkms prime-indicator && sudo prime-select intel && reboot
