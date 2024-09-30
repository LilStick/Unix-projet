#!/bin/bash
while true; do 
    clear  
    echo "Menu principal"
    echo "1. Choix de type de scan nmap"
    echo "2. Scan avancé (détection OS et services)"
    echo "3. Automatiser un scan régulier avec cron"
    echo "4. Quitter"
    read -p "Votre choix: " choix

    case $choix in 
    1)
        while true; do
            clear
            echo "1. Scan rapide"
            echo "2. Scan complet (TCP et UDP)"
            echo "3. Scan personnalisé"
            echo "4. Retour au menu principal"
            read -p "Votre choix (ou 'r' pour revenir au menu principal): " choix2
            if [[ $choix2 == "r" ]]; then
                break
            fi
            case $choix2 in
            1)
                read -p "Entrez l'adresse IP, plage d'IP ou plusieurs hôtes (ex : 192.168.1.1, 192.168.1.2 ou 192.168.1.1-192.168.1.50) : " ip
                nmap -F $ip
                read -p "Appuyez sur une touche pour continuer..."
                ;;
            2)
                read -p "Entrez l'adresse IP, plage d'IP ou plusieurs hôtes (ex : 192.168.1.1, 192.168.1.2 ou 192.168.1.1-192.168.1.50) : " ip
                echo "1. Scan complet TCP"
                echo "2. Scan complet UDP"
                read -p "Votre choix: " tcp_udp
                if [ $tcp_udp -eq 1 ]; then
                    nmap -p 1-65535 $ip
                else
                    nmap -sU -p 1-65535 $ip
                fi
                read -p "Appuyez sur une touche pour continuer..."
                ;;
            3)
                read -p "Entrez l'adresse IP, plage d'IP ou plusieurs hôtes (ex : 192.168.1.1, 192.168.1.2 ou 192.168.1.1-192.168.1.50) : " ip
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
        clear
        echo "Automatisation du scan avec cron"
        read -p "Entrez l'adresse IP, plage d'IP ou plusieurs hôtes à scanner régulièrement (ex : 192.168.1.1, 192.168.1.2 ou 192.168.1.1-192.168.1.50) : " ip
        read -p "Entrez l'intervalle en minutes entre les scans: " intervalle
        echo "Exemples pour automatiser vos scans avec cron :"
        echo "1. Scan quotidien"
        echo "2. Scan hebdomadaire"
        read -p "Votre choix: " freq
        if [[ $freq -eq 1 ]]; then
            (crontab -l; echo "0 0 * * * nmap -F $ip > scan_report_$(date +\%Y\%m\%d).txt") | crontab -
            echo "Scan quotidien planifié."
        else
            (crontab -l; echo "0 0 * * 0 nmap -F $ip > scan_report_$(date +\%Y\%m\%d).txt") | crontab -
            echo "Scan hebdomadaire planifié."
        fi
        read -p "Appuyez sur une touche pour revenir au menu principal..."
        ;;
    4)
        echo "Quitter."
        exit 0
        ;;
    *)
        echo "Choix invalide"
        read -p "Appuyez sur une touche pour continuer..."
        ;;
    esac
done