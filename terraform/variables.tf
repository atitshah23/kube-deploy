variable "AWS_ACCESS_KEY_ID" {
  description = "AWS Access Key"
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "AWS Secret Key"
}

variable "aws_key_name" {
 description = "Key pair name to use for instances"
 default = "kube-deploy-kp"
}

variable "aws_security_group_id"{
 description = "Security group id to use for ec2 instances."
 default = "sg-0e60d55ff0c0ab900"
}

variable "aws_cluster_name" {
  description = "Name of AWS Cluster"
  default = "KubeCluster"
}

variable "aws_region" {
 description = "AWS Region"
 default = "us-east-1"
}

variable "aws_ami_id" {
 description = "AMI id for UBUNTU 16.04"
 default = "ami-0f9cf087c1f27d9b1"
}

variable "aws_instance_type" {
 description = "Instance type"
 default = "t2.medium"
}

variable "inventory_file" {
  description = "Where to store the generated inventory file"
  default = "inventory.cfg"
}