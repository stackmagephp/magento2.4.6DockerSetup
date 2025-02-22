#!/bin/bash

ln -s /etc/nginx/sites-available/magedemo.com.conf /etc/nginx/sites-enabled/magedemo.com.conf
service nginx start
service php8.2-fpm start