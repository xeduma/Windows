## installation OS - répair
Entrer dans le boot menu : https://www.pc83.fr/tools/liste-bios-key-boot-menu-key.html

Commande utilman.exe :  https://www.malekal.com/reinitialiser-de-passe-oublie-perdu-windows-utilman-exe/

# Raccourcis
## clavier
touche 1 | touche 2 | touche 3 | description
 ---: | :--- | -: | :-
 wind | x | d | a | shutdown
 wind | x | d | r | redémarrer
 wind | x | y |   | paramètre > système > info sys
 wind | r |   |   | executer
 wind | d |   |   | affiche le bureau
 

## executer
win + r


commande | description
 ---: | :---
shell:statup | programme au démarrage    current user
shell:common startup | programme au démarrage    tous les utilisateurs
%USERPROFILE%\Desktop | bureau de l'utilisateur actuel
%temp% | fichiers temporaires current user
ncpa.cpl | interfaces réseau




## Commande cmd
commande système | description
 ---: | :---
help | Aide
dir | lister
cd | Déplacer
d: | se déplacer vers le disque D:/
mkdir | créer un dossier
rd | Supprmer un dossier
tree | Affiche  aboressence
hostname | nom machine
time | changer l'heure
driverquery | affiche les pilotes
systeminfo | info système
print | imprimer un fichier
vol | info disk
Get-WmiObject -Class Win32_WinSAT | info système 
msinfo32.exe | info système


#Réseau 
commande réseau | description
 ---: | :---
netstat -a -n | affiche les connexion réseau
tracert www.google.fr | affiche les route des routeur  >    google.fr
ipconfig | affiche config réseau
netsh interface <ipv4/ipv6>| affiche la config de toutes les interface

```scp -r coucou pi@192.168.1.1:/home/pi/Minecraft```

