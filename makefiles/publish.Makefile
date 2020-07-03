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
# PUBLISH
#
########################################################################################################################

build-docker-image:
	@echo "${YELLOW}Building Docker image \"${AWS_ECR}/${API_TARGET_IMAGE_NAME}:${DOCKER_TAG}\"${RESET}"
	@docker build --build-arg NODE_IMAGE=${NODE_IMAGE} -t ${AWS_ECR}/${API_TARGET_IMAGE_NAME}:${DOCKER_TAG} ./app

push-docker-image:
	@echo "${YELLOW}Publishing Docker image: \"${AWS_ECR}/${API_TARGET_IMAGE_NAME}:${DOCKER_TAG}\"${RESET}"
	@docker push ${AWS_ECR}/${API_TARGET_IMAGE_NAME}:${DOCKER_TAG}

login-to-ecr:
	@echo "${YELLOW}Login to: \"${AWS_ECR}\"${RESET}"
	AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION} aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | docker login --username AWS --password-stdin ${AWS_ECR}
