# STIG URL: http://www.stigviewer.com/stig/red_hat_enterprise_linux_6/2014-06-11/finding/V-38672
# Finding ID:	V-38672
# Version:	RHEL-06-000289
# Finding Level:	Low
#
#     The netconsole service must be disabled unless required. The 
#     "netconsole" service is not necessary unless there is a need to debug 
#     kernel panics, which is not common.
#
#  CCI: CCI-000382
#  NIST SP 800-53 :: CM-7
#  NIST SP 800-53A :: CM-7.1 (iii)
#  NIST SP 800-53 Revision 4 :: CM-7 b
#
############################################################

script_V38672-describe:
  cmd.script:
  - source: salt://STIGbyID/cat3/files/V38672.sh

{% if salt['pkg.version']('initscripts') %}
# Ensure netconsole service is disabled and deactivated
svc_V38672-netconsoleDisabled:
  service.disabled:
  - name: 'netconsole'

svc_V38672-netconsoleDead:
  service.dead:
  - name: 'netconsole'
{% else %}
notify_V38672-package:
  cmd.run:
  - name: 'echo "Parent package of netconsole not installed"'
{% endif %}

