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
# INSTALL
#
########################################################################################################################

install-api:
	@make make-in-node MAKE_RULE=_install

_install-api:
	@npm install
