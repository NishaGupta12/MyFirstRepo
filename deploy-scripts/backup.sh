#!/bin/bash
# Taking Snapshot of Databases of Hearst Account

NOW_DATE=$(date '+%Y-%m-%d-%H-%M')
echo "this is testing"
qa_rds_Cluster=#{BuildVariables.qa_rds_Cluster}
ec2hostname=#{BuildVariables.ec2hostname}

echo $ec2hostname
echo $qa_rds_Cluster


