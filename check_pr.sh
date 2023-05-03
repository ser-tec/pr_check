#!/bin/bash

# Controlla se entrambi i percorsi esistono
if [ -d "$PR" ] && [ -d "$OCA" ]; then
    # Elenca le cartelle in entrambi i percorsi
    pr_folders=$(find "$PR" -maxdepth 1 -mindepth 1 -type d -exec basename {} \;)
    oca_folders=$(find "$OCA" -maxdepth 1 -mindepth 1 -type d -exec basename {} \;)

    # Trova e stampa le cartelle con lo stesso nome in entrambi i percorsi
    for folder in $pr_folders; do
        if [[ $oca_folders =~ (^|[[:space:]])"$folder"($|[[:space:]]) ]]; then
            echo "Cartella con lo stesso nome trovata: $folder"
        fi
    done
else
    echo "Uno o entrambi i percorsi non esistono. Verifica i percorsi e riprova."
fi
