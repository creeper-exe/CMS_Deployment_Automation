#!/bin/sh

echo "Waiting for postgres..."

python3 manage.py makemigrations
if [ $? -ne 0 ]; then
    echo "Make Migrations Failed"
    exit 1
else
    python3 manage.py migrate
    echo "Application Is Working"
    python3 manage.py runserver 0.0.0.0:8000
    python manage.py collectstatic --noinput
fi