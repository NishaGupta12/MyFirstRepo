#!/bin/bash
# set up some variables

NOW_DATE=$(date '+%Y-%m-%d-%H-%M')
RESTORE_FROM_INSTANCE_ID='myhearstdev'

echo "Creating manual snapshot of ${RESTORE_FROM_INSTANCE_ID}"
SNAPSHOT_ID_CLUSTER=$( aws rds create-db-cluster-snapshot  --db-cluster-identifier  $RESTORE_FROM_INSTANCE_ID-SSmanual-$NOW_DATE --db-cluster-snapshot-identifier $RESTORE_FROM_INSTANCE_ID --region 'us-east-1')
aws rds wait db-cluster-snapshot-completed --db-cluster-snapshot-identifier $SNAPSHOT_ID_CLUSTER
echo "Finished creating new Dev Server Cluster Snapshot ${SNAPSHOT_ID_CLUSTER} from ${RESTORE_FROM_INSTANCE_ID}"
