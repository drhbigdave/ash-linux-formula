#!/bin/sh
#
# STIG URL: http://www.stigviewer.com/stig/red_hat_enterprise_linux_6/2014-06-11/finding/V-38458
# Finding ID:	V-38458
# Version:	RHEL-06-000042
# Finding Level:	Medium
#
#     The /etc/group file must be owned by root. The "/etc/group" file 
#     contains information regarding groups that are configured on the 
#     system. Protection of this file is important for system security.
#
############################################################

# Standard outputter function
diag_out() {
   echo "${1}"
}

diag_out "----------------------------------"
diag_out "STIG Finding ID: V-38458"
diag_out "  Ensure /etc/group file is owned"
diag_out "  by the root user"
diag_out "----------------------------------"
