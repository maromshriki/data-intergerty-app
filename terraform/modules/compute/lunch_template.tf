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
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd

    echo "Hello from $(hostname)" > /var/www/html/index.html
EOF
)
  
}