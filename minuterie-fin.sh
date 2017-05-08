port=`$(echo cat /home/pi/jarvis/plugins_installed/jarvis-minuterie/port.txt)`
curl "$port?say=Fin%20de%20la%20minuterie%20programmé%20par%20Jarvis"
mpg321 /home/pi/jarvis/plugins_installed/jarvis-minuterie/bruit7.mp3
/home/pi/jarvis/jarvis.sh "-s Fin de la minuterie"
