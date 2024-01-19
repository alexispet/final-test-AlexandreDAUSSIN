#!/bin/sh

if [ $NODE_ENV == "DEV" ]
then
    echo "On est en development"
    npm install
    npm install -g lighthouse
fi

# Exécuter le script d'import de la base de données
echo "Exécution du script d'import de la base de données..."
npm run db:import

exec "$@"