#!/bin/bash

dir=$(dirname $0)
cd $dir

# Import the configuration file
. pr_check.conf

# Controlla se entrambi i percorsi esistono
if [ -d "$PR" ] && [ -d "$OCA" ]; then
    # Elenca le cartelle in entrambi i percorsi
    pr_folders=$(find "$PR" -maxdepth 1 -mindepth 1 -type d -exec basename {} \;)
    oca_folders=$(find "$OCA" -maxdepth 1 -mindepth 1 -type d -exec basename {} \;)

    # Trova e stampa le cartelle con lo stesso nome in entrambi i percorsi
    duplicate_folders=""
    for folder in $pr_folders; do
        if [[ $oca_folders =~ (^|[[:space:]])"$folder"($|[[:space:]]) ]]; then
            echo "Cartella con lo stesso nome trovata: $folder"
            duplicate_folders+="\n$folder"
        fi
    done
    
# Invia la lista delle cartelle duplicate via e-mail solo se $EMAIL non è vuota
if [ -n "$duplicate_folders" ]; then
    if [ -n "$EMAIL" ]; then
        host_name=$(hostname)
        echo -e "Host: $host_name\n\nCartelle duplicate trovate:$duplicate_folders" | mail -s "Report cartelle duplicate" $EMAIL
    else
        echo "L'indirizzo e-mail non è impostato. Impossibile inviare il report."
    fi
else
    echo "Nessuna cartella duplicata trovata."
fi
    
else
    echo "Uno o entrambi i percorsi non esistono. Verifica i percorsi e riprova."
fi
