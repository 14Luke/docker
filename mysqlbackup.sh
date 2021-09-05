#!/bin/bash

DBNAME=$1
DBPASS=$2
DBHOST=$3
BACKUP=$(date +%H%M%d%m%Y)-$DBNAME.sql
S3BUK=$4
AWSAK=$5
AWSSK=$6


mysql -u root -h $DBHOST -P 3300 -p $DBPASS $DBNAME > /tmp/$BACKUP
echo "$DBNAME has been dumped and stored !"
export AWS_ACCESS_KEY_ID=$AWSAK
export AWS_SECRET_ACCESS_KEY=$AWSSK
aws cp /tmp/$BACKUP s3://$S3BUK/$BACKUP
echo "$DBNAME backup has been stored on s3 $S3BUK"



