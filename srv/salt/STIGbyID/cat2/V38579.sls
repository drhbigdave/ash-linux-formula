# STIG URL: http://www.stigviewer.com/stig/red_hat_enterprise_linux_6/2014-06-11/finding/V-38579
# Finding ID:	V-38579
# Version:	RHEL-06-000065
# Finding Level:	Medium
#
#     The system boot loader configuration file(s) must be owned by root. 
#     Only root should be able to modify important boot parameters.
#
############################################################

script_V38579-describe:
  cmd.script:
  - source: salt://STIGbyID/cat2/files/V38579.sh

{% if salt['file.file_exists']('/boot/grub.conf') %}
file-V38579-bootGrub:
  file.managed:
  - name: '/boot/grub.conf'
  - user: root
{% endif %}

{% if salt['file.file_exists']('/boot/grub/grub.conf') %}
file-V38579-bootGrubGrub:
  file.managed:
  - name: '/boot/grub/grub.conf'
  - user: root
{% endif %}

{% if salt['file.file_exists']('/etc/grub.conf') %}
file-V38579-etcGrub:
  file.symlink:
  - name: '/etc/grub.conf'
  - target: '/boot/grub/grub.conf'
{% endif %}

