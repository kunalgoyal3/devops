

resource "aws_ecr_repository" "order_service" {
  name         = "order_service"
  force_delete = true

  image_scanning_configuration {
    scan_on_push = true
  }
}

output "ecr_repository_url" {
  value = aws_ecr_repository.order_service.repository_url
}
