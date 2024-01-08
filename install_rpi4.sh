echo 'Updating the pi'
sleep 1
sudo apt-get update
sudo apt-get upgrade
echo '==============='
echo 'installing make'
sleep 1
sudo apt-get install make build-essential
echo '==============='
echo 'installing libraspberrypi-dev'
sleep 1
sudo apt-get install libraspberrypi-dev
echo '==============='
make GPIO21=1
sleep 1
echo '==============='
echo 'Changing either ARM core frequency scaling governor settings to "powersave" or changing ARM minimum and maximum core frequencies to one constant value'
echo 'visit https://www.raspberrypi.org/forums/viewtopic.php?t=152692 for more explanation'
sleep 1
echo "powersave"| sudo tee /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo 'DONE installing'
sleep 1
echo 'Use lower FM broadcasting frequencies (below 93 MHz) when transmitting'