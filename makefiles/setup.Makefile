################################################################################
# This file is part of the "mynotes-svc" project.
#
# Copyright (C) 2020 - Gamaliel SICK, IDEACLOUD.
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
################################################################################

########################################################################################################################
#
# SETUP
#
########################################################################################################################

# Fix comes from https://github.com/docker/for-linux/issues/219
fix-fedora:
	sudo mkdir /sys/fs/cgroup/systemd
	sudo mount -t cgroup -o none,name=systemd cgroup /sys/fs/cgroup/systemd

setup:
#	@echo "${YELLOW}Login to AWS ECR${RESET}"
#	@${ECR_LOGIN_CMD}
	@echo "${YELLOW}Create docker-compose environnement${RESET}"
	@${DOCKER_COMPOSE} up --remove-orphans -d node redis api > /dev/null

	@make create-local-user-in-node
#	@make create-local-user-in-api

build:
	pwd
	@${DOCKER_COMPOSE} build

clean: ##@setup Remove all components
	@echo "${YELLOW}Stop and remove docker-compose${RESET}"
	@make stop
	@${DOCKER_COMPOSE} rm -f

# aws sts get-session-token --serial-number arn:aws:iam::xxxxxxxxxxx:mfa/gsick --token-code <code-generated-by-MFA-device>
# aws configure set aws_session_token <the-session-token-in-the-output-of-above-command>
#ecr:
#	AWS_PROFILE=my_profile aws ecr get-login-password \
#	--region ${ECR_AWS_REGION} \
#	| docker login \
#	--username AWS \
#	--password-stdin ${ECR_REGISTRY}
