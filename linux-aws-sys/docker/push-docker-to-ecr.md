### Push docker image to aws ECR

## Authenticate docker to ECR
aws ecr get-login-password --region eu-north-1 | \
docker login --username aws --password-stdin <aws-account>.dkr.ecr.eu-north-1.amazonaws.com

## Tag image
docker tag seqtk:2.0 <aws-account>.dkr.ecr.eu-north-1.amazonaws.com/seqtk:2.0

## Push image
docker push <aws-account>.dkr.ecr.eu-north-1.amazonaws.com/seqtk:2.0