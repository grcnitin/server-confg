#!/bin/bash

# Get the hostname and use it as the filename
x=$(cat /etc/hostname)

# Write HOSTNAME section
echo "************************ HOSTNAME ************************" >> $x.txt
echo "$x" >> $x.txt

# Write Hosts Info section
echo "************************ Hosts Info ************************" >> $x.txt
cat /etc/hosts >> $x.txt

# Write CPU AVX Support section
echo "************************ CPU AVX Support ************************" >> $x.txt
lscpu | grep avx >> $x.txt

# Write GCC Version section
echo "************************ GCC Version ************************" >> $x.txt
gcc --version >> $x.txt

# Write Python Version section
echo "************************ Python Version ************************" >> $x.txt
python3 --version >> $x.txt

# Write DATE section
echo "************************ DATE ************************" >> $x.txt
date >> $x.txt

# Write KERNEL VERSION section
echo "************************ KERNEL VERSION ************************" >> $x.txt
uname -r >> $x.txt

# Write PCI Info section
echo "************************ PCI Info ************************" >> $x.txt
lspci | grep th >> $x.txt

# Write CPU Info section
echo "************************ CPU info ************************" >> $x.txt
lscpu | head -n 16 >> $x.txt

# Write RAM Info section
echo "************************ RAM Info ************************" >> $x.txt
dmidecode -t17 | head -n 35 >> $x.txt

# Write Memory Info section
echo "************************ Memory Info ************************" >> $x.txt
cat /proc/meminfo | head -n 20 >> $x.txt

# Write Motherboard Info section
echo "************************ MB info ************************" >> $x.txt
dmidecode -t2 >> $x.txt

#Motherboard Serial number
echo "************************ MB Serial Number ************************" >> $x.txt
dmidecode -s system-serial-number >> $x.txt

# Write CPU Frequency section
echo "************************ CPU Frequency  ************************" >> $x.txt
dmidecode -t processor | grep "Speed" >> $x.txt

# Write Disk Info section
echo "************************ Disk Info ************************" >> $x.txt
# Block device information
lsblk >> $x.txt

# Write IP Address section
echo "************************ IP Address  ************************" >> $x.txt
ip a >> $x.txt

# Append Exanic Driver Check
echo "************************ Exanic Driver ************************" >> $x.txt
lsmod | grep exanic >> $x.txt

# Write Boot Parameters section
echo "************************ Boot Parameters ************************" >> $x.txt
cat /proc/cmdline >> $x.txt

# Write DNS Info section
echo "************************ DNS Info ************************" >> $x.txt
cat /etc/resolv.conf >> $x.txt


echo "System information has been saved to $x.txt"

