module "backend-posts-service" {
  source = "./modules/backend-service"

  name               = "posts"
  container_port     = 3000
  ecs_cluster        = aws_ecs_cluster.photos_cluster.id
  security_groups    = [aws_security_group.load_balancer_security_group.id]
  target_group_arn   = aws_lb_target_group.target_group.arn
  execution_role_arn = aws_iam_role.ecsTaskExecutionRole.arn
  subnets            = [
    aws_default_subnet.default_subnet_a.id,
    aws_default_subnet.default_subnet_b.id
  ]
}
