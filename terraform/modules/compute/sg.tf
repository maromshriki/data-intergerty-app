resource "aws_security_group" "app_sg" {
  name   = "app-private-sg"
  vpc_id = var.vpc_id

  # אין SSH בכלל! עובדים רק דרך SSM
  ingress = []

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}