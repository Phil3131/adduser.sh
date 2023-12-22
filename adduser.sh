#!/bin/bash

# Vérification de la présence d'arguments
if [ $# -eq 0 ]; then
    echo "Il manque les noms d'utilisateurs en argument - Fin du script"
    exit 1
fi

# Parcours des arguments (noms d'utilisateurs)
for utilisateur in "$@"; do
    # Vérification de l'existence de l'utilisateur
    if id "$utilisateur" &>/dev/null; then
        echo "L'utilisateur $utilisateur existe déjà"
    else
        # Création de l'utilisateur
        sudo useradd "$utilisateur"
        # Vérification de la création de l'utilisateur
        if [ $? -eq 0 ]; then
            echo "L'utilisateur $utilisateur a été créé"
        else
            echo "Erreur lors de la création de l'utilisateur $utilisateur"
        fi
    fi
done

exit 0
