
variable "name" {
  type        = string
  default     = ""
  description = "Name of launch template to be created."
}

variable "use_name_prefix" {
  type        = bool
  default     = true
  description = <<-EOT
    Determines whether to use `launch_template_name`
    as is or create a unique name beginning with the `launch_template_name` as the prefix.
  EOT
}

variable "description" {
  type        = string
  default     = null
  description = "Description of the launch template."
}

variable "ebs_optimized" {
  type        = bool
  default     = null
  description = "If true, the launched EC2 instance will be EBS-optimized."
}

variable "image_id" {
  type        = string
  default     = ""
  description = "The AMI from which to launch the instance."
}

variable "key_name" {
  type        = string
  default     = null
  description = "The key name that should be used for the instance."
}

variable "user_data" {
  type        = string
  default     = null
  description = "The Base64-encoded user data to provide when launching the instance."
}

variable "network_interfaces" {
  type        = list(any)
  default     = []
  description = "Customize network interfaces to be attached at instance boot time."
}

variable "security_groups" {
  type        = list(string)
  default     = []
  description = "A list of security group IDs to associate."
}

variable "instance_type" {
  type        = string
  default     = null
  description = "The type of the instance. If present then `instance_requirements` cannot be present."
}

variable "instance_requirements" {
  type        = any
  default     = {}
  description = <<-EOT
    The attribute requirements for the type of instance.
    If present then `instance_type` cannot be present.
  EOT
}

variable "metadata_options" {
  type        = map(string)
  default     = {}
  description = "Customize the metadata options for the instance."
}

variable "enable_monitoring" {
  type        = bool
  default     = true
  description = "Enables/disables detailed monitoring."
}

variable "default_version" {
  type        = string
  default     = null
  description = "Default Version of the launch template."
}

variable "update_default_version" {
  type        = string
  default     = null
  description = <<-EOT
    Whether to update Default Version each update.
    Conflicts with `default_version`.
  EOT
}

variable "disable_api_termination" {
  type        = bool
  default     = null
  description = "If true, enables EC2 instance termination protection."
}

variable "disable_api_stop" {
  type        = bool
  default     = null
  description = "If true, enables EC2 instance stop protection."
}

variable "instance_initiated_shutdown_behavior" {
  type        = string
  default     = "stop"
  description = <<-EOT
    Shutdown behavior for the instance.
    Can be `stop` or `terminate`. (Default: `stop`)
  EOT
}

variable "kernel_id" {
  type        = string
  default     = null
  description = "The kernel ID."
}

variable "ram_disk_id" {
  type        = string
  default     = null
  description = "The ID of the ram disk."
}

variable "block_device_mappings" {
  type        = list(any)
  default     = []
  description = "Specify volumes to attach to the instance besides the volumes specified by the AMI."
}

variable "capacity_reservation_specification" {
  type        = any
  default     = {}
  description = "Targeting for EC2 capacity reservations."
}

variable "cpu_options" {
  type        = map(string)
  default     = {}
  description = "The CPU options for the instance."
}

variable "credit_specification" {
  type        = map(string)
  default     = {}
  description = "Customize the credit specification of the instance."
}

variable "elastic_gpu_specifications" {
  type        = map(string)
  default     = {}
  description = "The elastic GPU to attach to the instance."
}

variable "elastic_inference_accelerator" {
  type        = map(string)
  default     = {}
  description = "Configuration block containing an Elastic Inference Accelerator to attach to the instance."
}

variable "enclave_options" {
  type        = map(string)
  default     = {}
  description = "Enable Nitro Enclaves on launched instances."
}

variable "hibernation_options" {
  type        = map(string)
  default     = {}
  description = "The hibernation options for the instance."
}

variable "instance_market_options" {
  type        = any
  default     = {}
  description = "The market (purchasing) option for the instance."
}

variable "license_specifications" {
  type        = map(string)
  default     = {}
  description = "A list of license specifications to associate with."
}

variable "maintenance_options" {
  type        = any
  default     = {}
  description = "The maintenance options for the instance."
}

variable "placement" {
  type        = map(string)
  default     = {}
  description = "The placement of the instance."
}

variable "private_dns_name_options" {
  type        = map(string)
  default     = {}
  description = "The options for the instance hostname. The default values are inherited from the subnet."
}


variable "iam_instance_profile_arn" {
  type        = string
  default     = null
  description = "Amazon Resource Name (ARN) of an existing IAM instance profile."
}

variable "iam_instance_profile_name" {
  type        = string
  default     = null
  description = "The name of the IAM instance profile."
}

variable "tag_specifications" {
  type        = list(any)
  default     = []
  description = "The tags to apply to the resources during launch."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A map of tags to assign to resources."
}
