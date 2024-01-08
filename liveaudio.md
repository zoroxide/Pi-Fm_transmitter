### Use as general audio output device
[hydranix](https://github.com/markondej/fm_transmitter/issues/144) has came up with simple method of using transmitter as an general audio output device. In order to achieve this you should load "snd-aloop" module and stream output from loopback device to transmitter application:
```
sudo modprobe snd-aloop
arecord -D hw:1,1,0 -c 1 -d 0 -r 22050 -f S16_LE | sudo ./fm_transmitter -f 100.6 - &
```
Please keep in mind loopback device should be set default ALSA device (see [this article](https://www.alsa-project.org/wiki/Setting_the_default_device)). Also parameter "-D hw:X,1,0" should be pointing this device (use card number instead of "X").
### Microphone support
In order to use a microphone live input use the `arecord` command, eg.:
```
arecord -D hw:1,0 -c 1 -d 0 -r 22050 -f S16_LE | sudo ./fm_transmitter -f 100.6 -
```
In cases of a performance drop down use ```plughw:1,0``` instead of ```hw:1,0``` like this:
```
arecord -D plughw:1,0 -c 1 -d 0 -r 22050 -f S16_LE | sudo ./fm_transmitter -f 100.6 -
```
