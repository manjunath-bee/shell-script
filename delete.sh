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

# This function will wait 20 seconds and show the percent from the wait from 10% till 100%
function waiting () {
   for c in `seq 1 10` 
   do
      let c*=10
      echo -ne "$c%\033[0K\r"
      sleep 2
   done
}

# This function will check if the return of a command was empty, case the return is empty meaning that the object already was deleted from amazon
function checkResult()
{
   result="$1"
   if [ "z$result" == "z" ]; then
      return 0
   else
   echo "[Result: $result]"
     waiting
     return 1
   fi 
}

echo "Excluding RDS instance"
echo "checking RDS instance name:"
for RDS_name in `aws rds describe-db-instances --query 'DBInstances[*].DBInstanceIdentifier' --output text` ; do 
  echo "Deleting: $RDS_name" 
  aws rds delete-db-instance --db-instance-identifier "$RDS_name" --skip-final-snapshot 
  waiting
done

echo "disable proction RDS instance"
echo "checking RDS instance name:"
for RDS_name in `aws rds describe-db-instances --query 'DBInstances[*].DBInstanceIdentifier' --output text` ; do 
  echo "Deleting: $RDS_name" 
  aws rds modify-db-instance --db-instance-identifier "$RDS_name"  --no-deletion-protection --apply-immediately
  waiting
done

echo "Excluding RDS instance"
echo "checking RDS instance name:"
for RDS_name in `aws rds describe-db-instances --query 'DBInstances[*].DBInstanceIdentifier' --output text` ; do 
  echo "Deleting: $RDS_name" 
  aws rds delete-db-instance --db-instance-identifier "$RDS_name" --skip-final-snapshot 
  waiting
done



