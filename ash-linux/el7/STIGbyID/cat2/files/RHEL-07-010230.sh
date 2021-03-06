#!/bin/sh
# Finding ID:	RHEL-07-010230
# Version:	RHEL-07-010230_rule
# SRG ID:	SRG-OS-000076-GPOS-00044
# Finding Level:	medium
# 
# Rule Summary:
#	Existing passwords must be restricted to a 60-day maximum lifetime.
#
# CCI-000199 
#    NIST SP 800-53 :: IA-5 (1) (d) 
#    NIST SP 800-53A :: IA-5 (1).1 (v) 
#    NIST SP 800-53 Revision 4 :: IA-5 (1) (d) 
#
#################################################################
# Standard outputter function
diag_out() {
   echo "${1}"
}

diag_out "----------------------------------------"
diag_out "STIG Finding ID: RHEL-07-010230"
diag_out "   Existing passwords must be restricted"
diag_out "   to a 60-day maximum lifetime."
diag_out "----------------------------------------"
