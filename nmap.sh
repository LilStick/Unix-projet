#!/bin/bash
while true; do 
    clear  
    echo " 1. Choix de type de scan nmap"
    read -p "Votre choix: " choix
    case $choix in 
    1)
        echo "1. scan rapide"
        echo "2. scan complet"
        echo "3. scan personnalisé"
        read -p "Votre choix: " choix2
        case $choix2 in
        1)
            read -p "Entrez l'adresse IP ou le nom de domaine: " ip
            nmap -F $ip ;;
        2)
            nmap -p 1-6553 ;;
        3)
            read -p "Entrez le un ou plusieurs port ou plages de ports à scanner: " ip
            nmap -p $ip ;;
        *)
            echo "Choix invalide"
            read -p "Appuyez sur une touche pour continuer..." ;;
        esac
        ;;
    *)
        echo "Choix invalide"
        read -p "Appuyez sur une touche pour continuer..." ;;
    esac
done