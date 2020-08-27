resource "aws_ecr_repository" "posts_repository" {
  name = "posts"
}

resource "aws_ecs_task_definition" "posts_service_task" {
  family                   = "posts-service-task"
  container_definitions    = <<DEFINITION
  [
    {
      "name": "posts-service-task",
      "image": "${aws_ecr_repository.posts_repository.repository_url}",
      "essential": true,
      "portMappings": [
        {
          "containerPort": 3000,
          "hostPort": 3000
        }
      ],
      "memory": 512,
      "cpu": 256
    }
  ]
  DEFINITION
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  memory                   = 512
  cpu                      = 256
  execution_role_arn       = aws_iam_role.ecsTaskExecutionRole.arn
}

resource "aws_iam_role" "ecsTaskExecutionRole" {
  name               = "ecsTaskExecutionRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

resource "aws_ecs_service" "posts_service" {
  name            = "posts_service"
  cluster         = aws_ecs_cluster.photos_cluster.id
  task_definition = aws_ecs_task_definition.posts_service_task.arn
  launch_type     = "FARGATE"
  desired_count   = 3

  network_configuration {
    subnets = [
      aws_default_subnet.default_subnet_a.id,
      aws_default_subnet.default_subnet_b.id
    ]
    assign_public_ip = true
    security_groups  = [aws_security_group.posts_service_security_group.id]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.target_group.arn
    container_name   = "posts-service-task"
    container_port   = 3000
  }
}

resource "aws_security_group" "posts_service_security_group" {
  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.load_balancer_security_group.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
