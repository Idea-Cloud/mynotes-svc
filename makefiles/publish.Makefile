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
	@echo "${YELLOW}Building Docker image \"${TARGET_DOCKER_REGISTRY}/${API_TARGET_IMAGE_NAME}:${DOCKER_TAG}\"${RESET}"
	@docker build -t ${TARGET_DOCKER_REGISTRY}/${API_TARGET_IMAGE_NAME}:${DOCKER_TAG} ./app

push-docker-image:
	@echo "${YELLOW}Publishing Docker image: \"${TARGET_DOCKER_REGISTRY}/${API_TARGET_IMAGE_NAME}:${DOCKER_TAG}\"${RESET}"
	@docker push ${TARGET_DOCKER_REGISTRY}/${API_TARGET_IMAGE_NAME}:${DOCKER_TAG}
