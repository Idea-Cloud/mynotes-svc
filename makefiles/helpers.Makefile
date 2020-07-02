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
# HELPERS
#
########################################################################################################################

_%-should-be-up:
	@/bin/sh -c ' \
	    IS_UP=`${DOCKER_COMPOSE} ps ${*} | grep Up`; \
	    if [ -z "$${IS_UP}" ] ; \
	        then echo "${RED}${*} is down. You should start stack through make start${RESET}"; exit 1; \
	    fi \
	'

run-in-%:
    ifdef NO_DOCKER
		@${COMMAND}
    else
		@make _${*}-should-be-up
		@${DOCKER_COMPOSE} exec --user ${LOCAL_USER_UID}:${LOCAL_USER_GID} -T ${*} /bin/sh -c "${COMMAND}"
    endif

run-as-root-in-%:
    ifdef NO_DOCKER
		@${COMMAND}
    else
		@make _${*}-should-be-up
		@${DOCKER_COMPOSE} exec --user 0:0 -T ${*} /bin/sh -c "${COMMAND}"
    endif

make-in-%:
	@make run-in-${*} COMMAND="${LOCAL_ENV} make ${MAKE_RULE} args='${args}'"

make-as-root-in-%:
	@make run-as-root-in-${*} COMMAND="${LOCAL_ENV} make ${MAKE_RULE} args='${args}'"

create-local-user-in-%:
	@make make-as-root-in-${*} LOCAL_ENV="LOCAL_USER_UID=${LOCAL_USER_UID} LOCAL_USER_GID=${LOCAL_USER_GID} DATA_PATH_PREFIX=${DATA_PATH_PREFIX}" MAKE_RULE=_create-local-user-in-container

_create-local-user-in-container:
ifneq ("$(shell id -u user 3>&1 1>&2 2>&3 1> /dev/null; echo $${?})", "0")
	@echo "${YELLOW}Creating local user${RESET}"
	@mkdir -p /home/user
	@touch /home/user/.bashrc
	@chown -R ${LOCAL_USER_UID}:${LOCAL_USER_GID} /home/user
ifeq ($(OS), Darwin)
	@chown -R ${LOCAL_USER_UID}:${LOCAL_USER_GID} ${DATA_PATH_PREFIX}
endif
	@getent group ${LOCAL_USER_GID} 2>&1 > /dev/null || groupadd -g ${LOCAL_USER_GID} user
	@useradd -o -u ${LOCAL_USER_UID} -g ${LOCAL_USER_GID} -s /bin/sh --home-dir /home/user user
endif
