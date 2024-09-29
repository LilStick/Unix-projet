Exécution du script

Pour exécuter ce script, suivez les étapes suivantes :

Créer le script : Créez un fichier nommé nmap.sh et copiez-y le code ci-dessus.
Rendre le script exécutable : Ouvrez un terminal et exécutez la commande suivante pour rendre le script exécutable :

`chmod +x nmap.sh`

Exécuter le script : Exécutez le script

`./nmap.sh`

Parfois il demande un niveau root pour effectuer une analyse d'os essayez donc cette commande qui nécessite le mdp du user :

`sudo ./nmap.sh`

Remarque
Assurez-vous d'avoir Nmap installé sur votre système. Vous pouvez installer Nmap en utilisant votre gestionnaire de paquets préféré. Par exemple, sur une distribution basée sur Debian, vous pouvez utiliser :

Pour debian/linux (via apt):

` sudo apt update`
`sudo apt install nmap`

Pour MacOS (via brew) :
`brew install nmap`

Pour Windows, tu peux installer Nmap en téléchargeant l’installateur depuis le site officiel de Nmap
