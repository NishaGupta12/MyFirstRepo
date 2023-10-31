#!/bin/bash
# Taking Snapshot of Databases of Hearst Account

NOW_DATE=$(date '+%Y-%m-%d-%H-%M')
echo "this is testing"

export DEPLOY_ENV=#{BuildVariables.ec2hostname}

echo $DEPLOY_ENV
echo $DEPLOY_ENV



