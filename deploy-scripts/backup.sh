#!/bin/bash
# Taking Snapshot of Databases of Hearst Account

NOW_DATE=$(date '+%Y-%m-%d-%H-%M')

if [ [ "$Environment" == "test" ] || ["$Environment" == "prod" ]] 
then
    echo "Creating manual snapshot of ${dbName}"
    SNAPSHOT_ID=$( aws rds create-db-cluster-snapshot  --db-cluster-identifier  $dbName-SSmanual-$NOW_DATE --db-cluster-snapshot-identifier $dbName --region 'us-east-1')
    aws rds wait db-cluster-snapshot-completed --db-cluster-snapshot-identifier $dbName
    echo "Finished creating new Dev Server Cluster Snapshot ${SNAPSHOT_ID_CLUSTER} from ${dbName}"
else
    echo "Creating manual snapshot of ${dbName}"
    SNAPSHOT_ID_DEV=$( aws rds create-db-cluster-snapshot  --db-cluster-identifier  $dbName-SSmanual-$NOW_DATE --db-cluster-snapshot-identifier $dbName --region 'us-east-1')
    aws rds wait db-cluster-snapshot-completed --db-cluster-snapshot-identifier $dbName
    echo "Finished creating new Dev Server Cluster Snapshot ${SNAPSHOT_ID_DEV} from ${dbName}"
fi
