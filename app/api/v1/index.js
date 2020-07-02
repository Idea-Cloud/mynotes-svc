/*
* This file is part of the "mynotes-svc" project.
*
* Copyright (C) 2020 - Gamaliel SICK, IDEACLOUD.
*
* For the full copyright and license information, please view the LICENSE
* file that was distributed with this source code.
*/

'use strict'

const router = require('koa-router')()
module.exports = router

router.use('/api/v1/content', require('./content').routes())
