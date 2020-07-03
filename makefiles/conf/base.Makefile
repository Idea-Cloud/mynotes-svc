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
# AWS Configuration
#
################################################################################
#AWS_ACCESS_KEY_ID           ?=
#AWS_SECRET_ACCESS_KEY       ?=
#AWS_DEFAULT_REGION          ?=
#AWS_ECR                     ?=

################################################################################
#
# Dockerfile Configuration
#
################################################################################
TARGET_DOCKER_REGISTRY      ?= ideacloud.registry
TARGET_IMAGE_NAME           ?= ideacloud-terraform
DOCKER_TAG                  ?= $(shell git log --pretty=format:'%h' -n 1)
DOCKER_IMAGE_NAME           ?= ${TARGET_DOCKER_REGISTRY}/${TARGET_IMAGE_NAME}:1.0.0

API_TARGET_IMAGE_NAME       ?= test
API_DOCKER_IMAGE_NAME       ?= ${AWS_ECR}/${API_TARGET_IMAGE_NAME}:${DOCKER_TAG}

################################################################################
#
# TF State Configuration
#
################################################################################
#TFSTATE_BUCKET              ?=
#TFSTATE_REGION              ?=

VPC_TFSTATE_KEY             ?= "vpc.tfstate"
EKS_TFSTATE_KEY             ?= "eks.tfstate"
ECR_TFSTATE_KEY             ?= "ecr.tfstate"
API_TFSTATE_KEY             ?= "api.tfstate"

################################################################################
#
# Global Configuration
#
################################################################################
#TFVARS_file                 ?=
#ENVIRONMENT                 ?=

KUBECONFIG                  ?= ${ROOT_DIR}/.config/config-${ENVIRONMENT}

################################################################################
#
# API Configuration
#
################################################################################
#API_PORT                    ?=
#REDIS_PORT                  ?=
#REDIS_HOST                  ?=
