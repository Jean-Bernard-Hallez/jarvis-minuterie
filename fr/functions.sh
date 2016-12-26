#!/bin/bash

jv_pg_ct_Minuterie () {
TempsminOusec=`echo $(jv_sanitize "$order") | cut -d" " -f1`
minOusec=`echo $(jv_sanitize "$order") | cut -d" " -f2`

if [[ "${TempsminOusec}" =~ ^[-+]?[0-9]+$ ]]
then
  echo "Ok c'est parti pour $order"
  jv_pg_ct_MinuterieOk
  return
else
TempsminOusec=`echo $(jv_sanitize "$order") | cut -d" " -f2`
minOusec=`echo $(jv_sanitize "$order") | cut -d" " -f3`
fi

if [[ "${TempsminOusec}" =~ ^[-+]?[0-9]+$ ]]
then
  echo "Ok c'est parti pour $order"
  jv_pg_ct_MinuterieOk
  return
else
TempsminOusec=`echo $(jv_sanitize "$order") | cut -d" " -f3`
minOusec=`echo $(jv_sanitize "$order") | cut -d" " -f4`
fi

if [[ "${TempsminOusec}" =~ ^[-+]?[0-9]+$ ]]
then
  echo "Ok c'est parti pour $order"
  jv_pg_ct_MinuterieOk
  return
else
  say=="Désolé vous me demandez $order ! je n'ai pas pu le déchiffrer"
  return
fi
}


jv_pg_ct_MinuterieOk () {
if [ -e "./plugins/jarvis-minuterie/port.txt" ]; then
echo "$AddressJarvis" > plugins/jarvis-minuterie/port.txt
./plugins/jarvis-minuterie/minuterie-deb.sh $TempsminOusec

else
sudo chmod +x ./plugins/jarvis-minuterie/minuterie-deb.sh
sudo chmod +x ./plugins/jarvis-minuterie/minuterie-fin.sh
echo "$AddressJarvis" > plugins/jarvis-minuterie/port.txt
./plugins/jarvis-minuterie/minuterie-deb.sh $TempsminOusec
fi

}


jv_pg_ct_MinuterieSTOP () {
atrm $(atq | cut -f1)
}
