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
make
sleep 1
echo 'DONE installing'