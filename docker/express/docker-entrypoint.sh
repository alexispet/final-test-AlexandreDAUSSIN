#!/bin/sh

if [ $NODE_ENV == "development" ]
then
    echo "On est en development"
    npm install
fi

# Exécuter le script d'import de la base de données
echo "Exécution du script d'import de la base de données..."
npm run db:import

exec "$@"