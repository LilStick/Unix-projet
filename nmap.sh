#!/bin/bash
while true; do 
    clear  
    echo "Menu principal"
    echo "1. Choix de type de scan nmap"
    echo "2. Scan avancé (détection OS et services)"
    echo "3. Quitter"
    read -p "Votre choix: " choix

    case $choix in 
    1)
        while true; do
            clear
            echo "1. Scan rapide"
            echo "2. Scan complet"
            echo "3. Scan personnalisé"
            echo "4. Retour au menu principal"
            read -p "Votre choix: " choix2
            case $choix2 in
            1)
                read -p "Entrez l'adresse IP ou le nom de domaine: " ip
                nmap -F $ip
                read -p "Appuyez sur une touche pour continuer..."
                ;;
            2)
                read -p "Entrez l'adresse IP ou le nom de domaine: " ip
                nmap -p 1-65535 $ip
                read -p "Appuyez sur une touche pour continuer..."
                ;;
            3)
                read -p "Entrez l'adresse IP ou le nom de domaine: " ip
                read -p "Entrez un ou plusieurs ports ou plages de ports à scanner: " ports
                nmap -p $ports $ip
                read -p "Appuyez sur une touche pour continuer..."
                ;;
            4)
                break
                ;;
            *)
                echo "Choix invalide"
                read -p "Appuyez sur une touche pour continuer..."
                ;;
            esac
        done
        ;;
    2)
        while true; do
            clear
            echo "1. Scan de détection du système d'exploitation"
            echo "2. Scan des services et des versions"
            echo "3. Les deux scans (OS et services)"
            echo "4. Retour au menu principal"
            read -p "Votre choix: " choix_avance
            if [[ $choix_avance -eq 4 ]]; then
                break
            fi
            read -p "Entrez l'adresse IP ou le nom de domaine: " target
            case $choix_avance in
            1)
                echo "Lancement du scan de détection de l'OS sur la cible $target..."
                nmap -O $target
                read -p "Appuyez sur une touche pour continuer..."
                ;;
            2)
                echo "Lancement du scan des services et des versions sur la cible $target..."
                nmap -sV $target
                read -p "Appuyez sur une touche pour continuer..."
                ;;
            3)
                echo "Lancement des deux scans (OS et services) sur la cible $target..."
                nmap -O -sV $target
                read -p "Appuyez sur une touche pour continuer..."
                ;;
            *)
                echo "Choix invalide"
                read -p "Appuyez sur une touche pour continuer..."
                ;;
            esac
        done
        ;;
    3)
        echo "Quitter."
        exit 0
        ;;
    *)
        echo "Choix invalide"
        read -p "Appuyez sur une touche pour continuer..."
        ;;
    esac
done