#!/bin/bash

REGION=eu-central-1
BUCKET=photos-terraform-state

aws s3 mb s3://$BUCKET --region $REGION
echo 'Created bucket for terraform state'
