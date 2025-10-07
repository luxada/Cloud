#!/bin/bash

echo ">>> Starting app..."

php -r "file_exists('.env') || copy('.env.example', '.env');"
php artisan key:generate

if [ "$seed_database" = "true" ]; then
  php artisan migrate --seed
fi

npm install
npm run build

php artisan serve --host=0.0.0.0