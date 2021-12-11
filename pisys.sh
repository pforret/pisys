#/bin/bash

echo "# HARDWARE"
#processor	: 0
#model name	: ARMv6-compatible processor rev 7 (v6l)
#BogoMIPS	: 697.95
#Features	: half thumb fastmult vfp edsp java tls
#CPU implementer	: 0x41
#CPU architecture: 7
#CPU variant	: 0x0
#CPU part	: 0xb76
#CPU revision	: 7
#
#Hardware	: BCM2835
#Revision	: 000f
#Serial		: 00000000539c9951
#Model		: Raspberry Pi Model B Rev 2
< /proc/cpuinfo gawk -F: '
  /model name/ {print "CPU   : " $2}
  /BogoMIPS/ {print "Speed : " $2}
  /Hardware/ {print "Chip  : " $2}
  /Serial/   {print "Serial: " $2}
  /Model/    {print "Model : " $2}
'
< /proc/meminfo gawk -F: '
  /MemTotal/ {gsub(" ","",$2); print "RAM   : " int($2/1000) " MB"}
'
df -h / \
| gawk ' /dev/ {print "SD Size: " $2;print "SD Free: " $4;}'
echo " "
echo "# SOFTWARE"
< /proc/version gawk '{print "OS:            " , $1 , $2 , $3}'
lsb_release -a 2>&1 | grep ':'
#lsb_release -a
#No LSB modules are available.
#Distributor ID:	Raspbian
#Description:	Raspbian GNU/Linux 11 (bullseye)
#Release:	11
#Codename:	bullseye
#more /proc/meminfo
