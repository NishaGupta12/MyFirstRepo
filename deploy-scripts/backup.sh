#!/bin/bash

# set up some variables

NOW_DATE=$(date '+%Y-%m-%d-%H-%M')
RESTORE_FROM_INSTANCE_ID=database-1

echo "Creating manual snapshot of ${RESTORE_FROM_INSTANCE_ID}"
SNAPSHOT_ID=$( aws rds create-db-snapshot --db-snapshot-identifier $RESTORE_FROM_INSTANCE_ID-manual-$NOW_DATE --db-instance-identifier $RESTORE_FROM_INSTANCE_ID --query 'DBSnapshot.[DBSnapshotIdentifier]' --output text )
aws rds wait db-snapshot-completed --db-snapshot-identifier $SNAPSHOT_ID
echo "Finished creating new snapshot ${SNAPSHOT_ID} from ${RESTORE_FROM_INSTANCE_ID}"
