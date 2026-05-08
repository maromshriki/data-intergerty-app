resource "aws_ecr_repository" "app" {
  name = "flask-app"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "flask-app"
  }
}

output "repository_url" {
  value = aws_ecr_repository.app.repository_url
}