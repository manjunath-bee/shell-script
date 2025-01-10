#!/bin/bash
#
# SCRIPT:
#     clean_aws.sh
#
# FUNCTION:
#     Delete all configuration and instances from aws like ec2,rds and cloudformation
#
# AUTHOR:
#     Diego Rocha
#     diego.rocha@adtsys.com.br
#
# DATE:
#     2016-06-01
#----------------------------------------------------------------------------------------
# How to use:
# 1. You might install the aws-cli 
#  Centos/Red Hat:
#    yum install aws-cli
#  Debian/Ubuntu:
#    apt-get install aws-cli
# 2. type:
#    aws configure
#    You should inform your access key and secret key and also the region
# 3. call the script
#    ./clean_aws.sh
#
#



echo "disable proction RDS instance"
echo "checking RDS instance name:"
for RDS_name in `aws rds describe-db-instances --query 'DBInstances[*].DBInstanceIdentifier' --region=us-east-1 --output text` ; do 
  echo "Deleting: $RDS_name" 
  aws rds modify-db-instance --db-instance-identifier "$RDS_name" --region=us-east-1 --no-deletion-protection --apply-immediately
  
done

echo "Excluding RDS instance"
echo "checking RDS instance name:"
for cluster_name in `aws rds describe-db-clusters --query '*[].[DBClusterIdentifier]' --region=us-east-1 --output text` ; do 
  echo "Deleting: $cluster_name" 
  aws rds modify-db-cluster --db-cluster-identifier "$cluster_name" --region=us-east-1 --no-deletion-protection --apply-immediately
done

echo "Excluding RDS instance"
echo "checking RDS instance name:"
for RDS_name in `aws rds describe-db-instances --query 'DBInstances[*].DBInstanceIdentifier' --region=us-east-1 --output text` ; do 
  echo "Deleting: $RDS_name" 
  aws rds delete-db-instance --db-instance-identifier "$RDS_name" --region=us-east-1 --skip-final-snapshot 
done

echo "Excluding RDS instance"
echo "checking RDS instance name:"
for cluster_name in `aws rds describe-db-clusters --query '*[].[DBClusterIdentifier]' --region=us-east-1 --output text` ; do 
  echo "Deleting: $cluster_name" 
  aws rds delete-db-cluster --db-cluster-identifier "$cluster_name"  --region=us-east-1 --skip-final-snapshot
done



