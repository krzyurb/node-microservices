variable "name" {}

variable "ecs_cluster" {}

variable "container_port" {}

variable "security_groups" {}

variable "subnets" {}

variable "target_group_arn" {}

variable "execution_role_arn" {}

resource "aws_ecr_repository" "ecr_repository" {
  name = var.name
}

resource "aws_ecs_task_definition" "ecs_task" {
  family                   = "${var.name}-service-task"
  container_definitions    = <<DEFINITION
  [
    {
      "name": "${var.name}-service-task",
      "image": "${aws_ecr_repository.ecr_repository.repository_url}",
      "essential": true,
      "portMappings": [
        {
          "containerPort": ${var.container_port},
          "hostPort": ${var.container_port}
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
  execution_role_arn       = var.execution_role_arn
}

resource "aws_ecs_service" "service" {
  name            = "${var.name}-service"
  cluster         = var.ecs_cluster
  task_definition = aws_ecs_task_definition.ecs_task.arn
  launch_type     = "FARGATE"
  desired_count   = 3

  network_configuration {
    subnets = var.subnets
    assign_public_ip = true
    security_groups  = [aws_security_group.security_group.id]
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = "${var.name}-service-task"
    container_port   = var.container_port
  }
}

resource "aws_security_group" "security_group" {
  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = var.security_groups
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
