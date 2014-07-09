# !/bin/bash

#################################################################################
# USAGE:  chmod +x install.sh
#         ./install <app-name> <aws bucket> <aws key> <aws secret>
#################################################################################

if [ -z $1 ]; then
  echo "**** YOU NEED TO SUPPLY AN APP NAME... EXITING ****"
  exit 1
elif [ -z $2 ]; then
  echo "**** YOU NEED TO SUPPLY THE AWS BUCKER NAME... EXITING ****"
  exit 1
elif [ -z $3 ];then
  echo "**** YOU NEED TO SUPPLY THE AWS KEY... EXITING ****"
  exit 1
elif [ -z $4 ];then
  echo "**** YOU NEED TO SUPPLY THE AWS SECRET... EXITING ****"
  exit 1
fi

echo "**** STARTING INSTALLATION ****"
echo "    ---> Creating heroku app $1"
heroku create $1 --stack cedar --app $1

echo "    ---> Pushing app $1 to heroku"
git push heroku master

echo "    ---> Running database migrations"
heroku run rake db:migrate --app $1

echo "    ---> Configuring $1"
# set the AWS bucket
heroku config:add AWS_BUCKET=$2
# set the AWS key
heroku config:add AWS_ACCESS_KEY_ID=$3
# set the AWS secret
heroku config:add AWS_SECRET_ACCESS_KEY=$4
echo "**** INSTALLATION COMPLETE ****"
