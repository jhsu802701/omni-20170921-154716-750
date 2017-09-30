#!/bin/bash

echo 'Enter the Facebook App ID: '
read FACEBOOK_ID

echo 'Enter the Facebook App Secret: '
read FACEBOOK_SECRET

echo 'Enter the Google App ID: '
read GOOGLE_ID

echo 'Enter the Google App Secret: '
read GOOGLE_SECRET

cp dot_env.txt .env
sed -i.bak "s|INSERT_FACEBOOK_APP_ID|$FACEBOOK_ID|g" .env
sed -i.bak "s|INSERT_FACEBOOK_APP_SECRET|$FACEBOOK_SECRET|g" .env
sed -i.bak "s|INSERT_GOOGLE_APP_ID|$GOOGLE_ID|g" .env
sed -i.bak "s|INSERT_GOOGLE_APP_SECRET|$GOOGLE_SECRET|g" .env
