################################################################################
# This file is part of the "mynotes-svc" project.
#
# Copyright (C) 2020 - Gamaliel SICK, IDEACLOUD.
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
################################################################################

################################################################################
#
# GLOBAL
#
################################################################################
variable "region" {
  description = "region"
}

variable "environment" {
  description = "Environment"
}

################################################################################
#
# REMOTE STATE
#
################################################################################
variable "tfstate_bucket" {
  description = "Terraform state bucket"
}

variable "vpc_tfstate_key" {
  description = "VPC tfstate key"
}

variable "eks_tfstate_key" {
  description = "EKS tfstate key"
}

variable "ecr_tfstate_key" {
  description = "ECR tfstate key"
}

################################################################################
#
# API
#
################################################################################
variable "api_image" {
  type        = string
  description = "API docker image name"
}

variable "api_port" {
  type        = string
  description = "API port listen to"
}

variable "redis_image" {
  type        = string
  description = "REDIS docker image name"
}

variable "redis_port" {
  type        = number
  description = "REDIS port"
}

variable "redis_host" {
  type        = string
  description = "REDIS host"
}
