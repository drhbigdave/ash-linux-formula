# Finding ID:	RHEL-07-030090
# Version:	RHEL-07-030090_rule
# SRG ID:	SRG-OS-000046-GPOS-00022
# Finding Level:	medium
# 
# Rule Summary:
#	The operating system must shut down upon audit processing
#	failure, unless availability is an overriding concern. If
#	availability is a concern, the system must alert the
#	designated staff (System Administrator [SA] and Information
#	System Security Officer [ISSO] at a minimum) in the event of
#	an audit processing failure.
#
# CCI-000139 
#    NIST SP 800-53 :: AU-5 a 
#    NIST SP 800-53A :: AU-5.1 (ii) 
#    NIST SP 800-53 Revision 4 :: AU-5 a 
#
#################################################################
{%- set stig_id = 'RHEL-07-030090' %}
{%- set helperLoc = 'ash-linux/el7/STIGbyID/cat2/files' %}
{%- set ruleFile = '/etc/audit/rules.d/audit.rules' %}
{%- set oflowVal = salt.pillar.get('ash-linux:lookup:audit-overflow', '2') %}
{%- set oflowStr = '-f '+ oflowVal %}

script_{{ stig_id }}-describe:
  cmd.script:
    - source: salt://{{ helperLoc }}/{{ stig_id }}.sh
    - cwd: /root

{%- if oflowVal in ruleFile %}
setval_{{ stig_id }}:
  cmd.run:
    - name: 'echo "Target audit-overflow value ({{ oflowVal }})already set"'
    - cwd: /root
{%- else %}
setval_{{ stig_id }}:
  file.replace:
    - name: '{{ ruleFile }}'
    - pattern: '^\s-f.*$'
    - repl: |
        # Inserted per STIG {{ stig_id }}
        {{ oflowStr }}
    - append_if_not_found: True
{%- endif %}
