locals {
  user_data = <<-EOT
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl enable --now httpd.service
    echo "Hello World from $(hostname -f)" > /var/www/html/index.html
  EOT
}

module "app_prod_web_label" {
  source  = "cloudposse/label/null"
  version = "v0.25.0"

  namespace  = "app"
  stage      = "prod"
  name       = "web"
  attributes = ["private"]
  delimiter  = "-"

  tags = {
    "BusinessUnit" = "XYZ",
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name = "name"

    values = [
      "amzn2-ami-hvm-*-x86_64-gp2",
    ]
  }
}

resource "aws_iam_role" "ssm" {
  name = join(module.app_prod_web_label.delimiter, [module.app_prod_web_label.stage, module.app_prod_web_label.name, "role"])

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Effect = "Allow",
        Sid    = ""
      }
    ]
  })

  tags = module.app_prod_web_label.tags
}

resource "aws_iam_instance_profile" "ssm" {
  name = join(module.app_prod_web_label.delimiter, [module.app_prod_web_label.stage, module.app_prod_web_label.name, "instance", "profile"])
  role = aws_iam_role.ssm.name

  tags = module.app_prod_web_label.tags
}

module "http_sg" {
  source  = "terraform-aws-modules/security-group/aws//modules/http-80"
  version = "~> 4.0"

  vpc_id = var.vpc_id

  name        = join(module.app_prod_web_label.delimiter, [module.app_prod_web_label.stage, module.app_prod_web_label.name, "sg"])
  description = "Security group for open HTTP protocol"

  ingress_cidr_blocks = ["0.0.0.0/0"]

  tags = module.app_prod_web_label.tags
}

module "app_prod_web" {
  source      = "../../"
  name        = join(module.app_prod_web_label.delimiter, [module.app_prod_web_label.stage, module.app_prod_web_label.name, "web-server"])
  description = "This is launch template to provisioning web servers"

  image_id      = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"

  user_data = base64encode(local.user_data)

  ebs_optimized     = true
  enable_monitoring = true

  update_default_version   = true
  iam_instance_profile_arn = aws_iam_instance_profile.ssm.arn

  security_groups = [module.http_sg.security_group_id]

  key_name = var.key_name

  block_device_mappings = [
    {
      # Root volume
      device_name = "/dev/xvda"
      no_device   = 0
      ebs = {
        delete_on_termination = true
        encrypted             = true
        volume_size           = 20
        volume_type           = "gp2"
      }
    },
    {
      device_name = "/dev/sda1"
      no_device   = 1
      ebs = {
        delete_on_termination = true
        encrypted             = true
        volume_size           = 30
        volume_type           = "gp2"
      }
    }
  ]

  metadata_options = {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 32
    instance_metadata_tags      = "enabled"
  }

  tag_specifications = [
    {
      resource_type = "instance"
      tags          = { WhatAmI = "Instance" }
    },
    {
      resource_type = "volume"
      tags          = merge({ WhatAmI = "Volume" })
    }
  ]

  tags = module.app_prod_web_label.tags
}
