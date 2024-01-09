
# PiFM
Use the Raspberry Pi as an FM transmitter. Works on every Raspberry Pi board.

Just get an FM receiver, connect a 20 - 40 cm plain wire to the Raspberry Pi's GPIO4 (PIN 7 on GPIO header) to act as an antenna, and you are ready for broadcasting.

## Note: this code is a modified version of [markondej/fm_transmitter](https://github.com/markondej/fm_transmitter), last visit is on 22-9-2023


## Installation and usage
Install all required files by running this bash file, if your board is from Raspberry pi 1 to 3, use ```install_rpi1-3.sh```, or if your board is Raspberry pi 4 use ```install_rpi4.sh```
```
sudo sh install_rpi1-3.sh
```
or you have raspberry pi 4 use :
```
sudo sh install_rpi4.sh
```
adding file to exce.
```
sudo chmod +x fm_transmitter
```
after a  succssefull installing and connecting a wire to GPIO 4 to the GPIO, run a test with:
```
sudo ./fm_transmitter -f 100.6 acoustic_guitar_duet.wav
```

Notice:
* -f frequency - Specifies the frequency in MHz, 100.0 by default if not passed
* acoustic_guitar_duet.wav - Sample WAV file, you can use your own

Other options:
* -d dma_channel - Specifies the DMA channel to be used (0 by default), type 255 to disable DMA transfer, CPU will be used instead
* -b bandwidth - Specifies the bandwidth in kHz, 100 by default
* -r - Loops the playback

After transmission has begun, simply tune an FM receiver to chosen frequency, you should hear the playback.

### Supported audio formats
note: only a wav file with these specification are supported:
- Sample rate: 96000.0 Hz
- Bit depth: 24 bit
- Channels: Stereo

You can transmit uncompressed WAV (.wav) files directly or read audio data from stdin, eg. using MP3 file:
```
sudo apt-get install sox libsox-fmt-mp3
sox example.mp3 -r 22050 -c 1 -b 16 -t wav - | sudo ./fm_transmitter -f 100.6 -
```
Please note only uncompressed WAV files are supported. If you receive the "corrupted data" error try converting the file, eg. by using SoX:
```
sudo apt-get install sox libsox-fmt-mp3
sox example.mp3 -r 22050 -c 1 -b 16 -t wav converted-example.wav
sudo ./fm_transmitter -f 100.6 converted-example.wav
```
Or you could also use FFMPEG:
```
ffmpeg -i example.webm -f wav -bitexact -acodec pcm_s16le -ar 22050 -ac 1 converted-example.wav
sudo ./fm_transmitter -f 100.6 converted-example.wav
```
## Legal note
Please keep in mind that transmitting on certain frequencies without special permissions may be illegal in your country.
## New features
* DMA peripheral support
* Allows custom frequency and bandwidth settings
* Works on every Raspberry Pi model
* Reads mono and stereo files
* Reads data from stdin

## TO DO:

- [x] adding install bash files
- [ ] making a dashboard webpage (soon)
- [ ] Adding Raspberry pi 5 support

Included sample audio was created by [graham_makes](https://freesound.org/people/graham_makes/sounds/449409/) and published on [freesound.org](https://freesound.org/)
