# Finding ID:	RHEL-07-021280
# Version:	RHEL-07-021280_rule
# SRG ID:	SRG-OS-000033-GPOS-00014
# Finding Level:	high
#
# Rule Summary:
#	The operating system must implement NIST FIPS-validated
#	cryptography for the following: to provision digital
#	signatures, to generate cryptographic hashes, and to
#	protect unclassified information requiring confidentiality
#	and cryptographic protection in accordance with applicable
#	federal laws, Executive Orders, directives, policies,
#	regulations, and standards.
#
# CCI-000068
# CCI-002450
#    NIST SP 800-53 :: AC-17 (2)
#    NIST SP 800-53A :: AC-17 (2).1
#    NIST SP 800-53 Revision 4 :: AC-17 (2)
#    NIST SP 800-53 Revision 4 :: SC-13
#
#################################################################
{%- stig_id = 'RHEL-07-021280' %}
{%- set helperLoc = 'ash-linux/el7/STIGbyID/cat1/files' %}

script_{{ stig_id }}-describe:
  cmd.script:
    - source: salt://{{ helperLoc }}/{{ stig_id }}.sh
    - cwd: /root
