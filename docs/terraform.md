<!-- BEGIN_TF_DOCS -->
## Documentation


### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.0.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [aws_launch_template.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_block_device_mappings"></a> [block\_device\_mappings](#input\_block\_device\_mappings) | Specify volumes to attach to the instance besides the volumes specified by the AMI. | `list(any)` | `[]` | no |
| <a name="input_capacity_reservation_specification"></a> [capacity\_reservation\_specification](#input\_capacity\_reservation\_specification) | Targeting for EC2 capacity reservations. | `any` | `{}` | no |
| <a name="input_cpu_options"></a> [cpu\_options](#input\_cpu\_options) | The CPU options for the instance. | `map(string)` | `{}` | no |
| <a name="input_credit_specification"></a> [credit\_specification](#input\_credit\_specification) | Customize the credit specification of the instance. | `map(string)` | `{}` | no |
| <a name="input_default_version"></a> [default\_version](#input\_default\_version) | Default Version of the launch template. | `string` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of the launch template. | `string` | `null` | no |
| <a name="input_disable_api_stop"></a> [disable\_api\_stop](#input\_disable\_api\_stop) | If true, enables EC2 instance stop protection. | `bool` | `null` | no |
| <a name="input_disable_api_termination"></a> [disable\_api\_termination](#input\_disable\_api\_termination) | If true, enables EC2 instance termination protection. | `bool` | `null` | no |
| <a name="input_ebs_optimized"></a> [ebs\_optimized](#input\_ebs\_optimized) | If true, the launched EC2 instance will be EBS-optimized. | `bool` | `null` | no |
| <a name="input_elastic_gpu_specifications"></a> [elastic\_gpu\_specifications](#input\_elastic\_gpu\_specifications) | The elastic GPU to attach to the instance. | `map(string)` | `{}` | no |
| <a name="input_elastic_inference_accelerator"></a> [elastic\_inference\_accelerator](#input\_elastic\_inference\_accelerator) | Configuration block containing an Elastic Inference Accelerator to attach to the instance. | `map(string)` | `{}` | no |
| <a name="input_enable_monitoring"></a> [enable\_monitoring](#input\_enable\_monitoring) | Enables/disables detailed monitoring. | `bool` | `true` | no |
| <a name="input_enclave_options"></a> [enclave\_options](#input\_enclave\_options) | Enable Nitro Enclaves on launched instances. | `map(string)` | `{}` | no |
| <a name="input_hibernation_options"></a> [hibernation\_options](#input\_hibernation\_options) | The hibernation options for the instance. | `map(string)` | `{}` | no |
| <a name="input_iam_instance_profile_arn"></a> [iam\_instance\_profile\_arn](#input\_iam\_instance\_profile\_arn) | Amazon Resource Name (ARN) of an existing IAM instance profile. | `string` | `null` | no |
| <a name="input_iam_instance_profile_name"></a> [iam\_instance\_profile\_name](#input\_iam\_instance\_profile\_name) | The name of the IAM instance profile. | `string` | `null` | no |
| <a name="input_image_id"></a> [image\_id](#input\_image\_id) | The AMI from which to launch the instance. | `string` | `""` | no |
| <a name="input_instance_initiated_shutdown_behavior"></a> [instance\_initiated\_shutdown\_behavior](#input\_instance\_initiated\_shutdown\_behavior) | Shutdown behavior for the instance.<br>Can be `stop` or `terminate`. (Default: `stop`) | `string` | `"stop"` | no |
| <a name="input_instance_market_options"></a> [instance\_market\_options](#input\_instance\_market\_options) | The market (purchasing) option for the instance. | `any` | `{}` | no |
| <a name="input_instance_requirements"></a> [instance\_requirements](#input\_instance\_requirements) | The attribute requirements for the type of instance.<br>If present then `instance_type` cannot be present. | `any` | `{}` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The type of the instance. If present then `instance_requirements` cannot be present. | `string` | `null` | no |
| <a name="input_kernel_id"></a> [kernel\_id](#input\_kernel\_id) | The kernel ID. | `string` | `null` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | The key name that should be used for the instance. | `string` | `null` | no |
| <a name="input_license_specifications"></a> [license\_specifications](#input\_license\_specifications) | A list of license specifications to associate with. | `map(string)` | `{}` | no |
| <a name="input_maintenance_options"></a> [maintenance\_options](#input\_maintenance\_options) | The maintenance options for the instance. | `any` | `{}` | no |
| <a name="input_metadata_options"></a> [metadata\_options](#input\_metadata\_options) | Customize the metadata options for the instance. | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of launch template to be created. | `string` | `""` | no |
| <a name="input_network_interfaces"></a> [network\_interfaces](#input\_network\_interfaces) | Customize network interfaces to be attached at instance boot time. | `list(any)` | `[]` | no |
| <a name="input_placement"></a> [placement](#input\_placement) | The placement of the instance. | `map(string)` | `{}` | no |
| <a name="input_private_dns_name_options"></a> [private\_dns\_name\_options](#input\_private\_dns\_name\_options) | The options for the instance hostname. The default values are inherited from the subnet. | `map(string)` | `{}` | no |
| <a name="input_ram_disk_id"></a> [ram\_disk\_id](#input\_ram\_disk\_id) | The ID of the ram disk. | `string` | `null` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | A list of security group IDs to associate. | `list(string)` | `[]` | no |
| <a name="input_tag_specifications"></a> [tag\_specifications](#input\_tag\_specifications) | The tags to apply to the resources during launch. | `list(any)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to resources. | `map(string)` | `{}` | no |
| <a name="input_update_default_version"></a> [update\_default\_version](#input\_update\_default\_version) | Whether to update Default Version each update.<br>Conflicts with `default_version`. | `string` | `null` | no |
| <a name="input_use_name_prefix"></a> [use\_name\_prefix](#input\_use\_name\_prefix) | Determines whether to use `launch_template_name`<br>as is or create a unique name beginning with the `launch_template_name` as the prefix. | `bool` | `true` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | The Base64-encoded user data to provide when launching the instance. | `string` | `null` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_launch_template_arn"></a> [launch\_template\_arn](#output\_launch\_template\_arn) | The ARN of the launch template |
| <a name="output_launch_template_default_version"></a> [launch\_template\_default\_version](#output\_launch\_template\_default\_version) | The default version of the launch template |
| <a name="output_launch_template_id"></a> [launch\_template\_id](#output\_launch\_template\_id) | The ID of the launch template |
| <a name="output_launch_template_latest_version"></a> [launch\_template\_latest\_version](#output\_launch\_template\_latest\_version) | The latest version of the launch template |
| <a name="output_launch_template_name"></a> [launch\_template\_name](#output\_launch\_template\_name) | The name of the launch template |

### Examples

```hcl
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
```

<!-- END_TF_DOCS -->