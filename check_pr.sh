#!/bin/bash

pr_path="/opt/odoo16/addons/PR"
l10n_italy_path="/opt/odoo16/addons/OCA/l10n-italy"

# Controlla se entrambi i percorsi esistono
if [ -d "$pr_path" ] && [ -d "$l10n_italy_path" ]; then
    # Elenca le cartelle in entrambi i percorsi
    pr_folders=$(find "$pr_path" -maxdepth 1 -mindepth 1 -type d -exec basename {} \;)
    l10n_italy_folders=$(find "$l10n_italy_path" -maxdepth 1 -mindepth 1 -type d -exec basename {} \;)

    # Trova e stampa le cartelle con lo stesso nome in entrambi i percorsi
    for folder in $pr_folders; do
        if [[ $l10n_italy_folders =~ (^|[[:space:]])"$folder"($|[[:space:]]) ]]; then
            echo "Cartella con lo stesso nome trovata: $folder"
        fi
    done
else
    echo "Uno o entrambi i percorsi non esistono. Verifica i percorsi e riprova."
fi
