port=`$(echo cat /home/pi/jarvis/plugins/jarvis-minuterie/port.txt)`
curl "$port?say=Fin%20de%20la%20minuterie%20programmé%20par%20Jarvis"
mpg321 /home/pi/jarvis/plugins/jarvis-minuterie/bruit7.mp3
