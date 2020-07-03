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
# DEPENDENCY
#
########################################################################################################################

add:
	@make make-in-node MAKE_RULE=_add

add-dev:
	@make make-in-node LOCAL_ENV="DEV_DEPENDENCY=--dev" MAKE_RULE=_add

_add:
	@echo "${YELLOW}Installing ${args}${RESET}"
	@yarn add ${DEV_DEPENDENCY} ${args}

remove:
	@make make-in-node MAKE_RULE=_remove

_remove:
	@echo "${YELLOW}Removing ${args}${RESET}"
	@npm remove ${args}
