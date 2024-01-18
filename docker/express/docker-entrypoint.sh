#!/bin/sh

if [ $NODE_ENV == "development" ]
then
    echo "On est en development"
    npm install
fi

# Attendre que le serveur de base de données soit prêt (ajuster selon vos besoins)
echo "Attente du serveur de base de données..."
until nc -z -v -w30 localhost 3000
do
  echo "En attente du serveur de base de données..."
  sleep 1
done

# Exécuter le script d'import de la base de données
echo "Exécution du script d'import de la base de données..."
npm run db:import

exec "$@"