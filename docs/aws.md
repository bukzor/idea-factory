AWS
===
Notes for remembering how to deal with my aws deployment.
No secrets here.

Sign in as Administrator at <https://bukzor.signin.aws.amazon.com/console>


I've put everything in the 'us-west-2' region.


Log in to the aws docker repository:

    eval "$(aws ecr get-login)"


Push to ECR: 

    ECR=710413374378.dkr.ecr.us-west-2.amazonaws.com
    docker tag dont.push.me/idea-factory/dev:buck $ECR/idea-factory:prod
    docker push $ECR/idea-factory:prod


To ssh to a machine: (make sure security group allows ssh)

    ssh -i ~/.ssh/bucksawssshkey.pem ec2-user@<public dns>
