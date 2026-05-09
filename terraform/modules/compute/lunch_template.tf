resource "aws_launch_template" "app" {
  name_prefix   = "app-"
  image_id      = "ami-0c02fb55956c7d316"
  instance_type = "t3.micro"

  vpc_security_group_ids = [var.app_sg_id]

  iam_instance_profile {
    name =var.instance_profile_name

  }

  user_data = base64encode(<<-EOF
    #!/bin/bash

    echo "DB_HOST=${var.db_endpoint}" >> /etc/environment
    yum install -y aws-cli
    
    set -e

    # install docker
    yum update -y
    yum install -y docker

    systemctl enable docker
    systemctl start docker

    # login to ECR
    aws ecr get-login-password --region us-east-1 \
      | docker login --username AWS --password-stdin <ECR_REGISTRY>

    # pull image
    docker pull <ECR_REGISTRY>/flask-app:latest

    # run container
    docker run -d \
      -p 80:5000 \
      --name flask-app \
      -e DB_HOST=${DB_HOST} \
      -e DB_PASSWORD=${DB_PASSWORD} \
      <ECR_REGISTRY>/flask-app:latest
    EOF
    )
  
}