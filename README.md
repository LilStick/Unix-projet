README - Script de Scan Nmap Automatisé

Fonctionnalités

Ce script permet de réaliser différents types de scans réseau en utilisant Nmap. Il propose les fonctionnalités suivantes :

    1.	Choix de type de scan Nmap
    •	Scan rapide : Effectue un scan rapide des ports courants.
    •	Scan complet : Scanne tous les ports TCP ou UDP.
    •	Scan personnalisé : Permet de spécifier des ports à scanner.
    •	Option pour revenir au menu principal à tout moment.
    2.	Scan avancé
    •	Détection de l’OS : Tente d’identifier le système d’exploitation de la cible.
    •	Détection des services et versions : Scanne les services en cours d’exécution et leurs versions.
    •	Scan combiné OS et services : Réalise à la fois la détection de l’OS et des services.
    •	Retour au menu principal possible.
    3.	Automatiser un scan régulier avec Cron
    •	Planifie un scan régulier (quotidien ou hebdomadaire) via cron.
    •	Le résultat du scan est enregistré dans un fichier texte avec la date du jour.
    4.	Quitter
    •	Permet de quitter le script à tout moment.

Usage

Lancez le script en ligne de commande et suivez les instructions pour effectuer les différents types de scans ou automatiser les scans réguliers.

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
