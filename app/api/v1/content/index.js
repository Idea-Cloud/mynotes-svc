 /*
* This file is part of the "mynotes-svc" project.
*
* Copyright (C) 2020 - Gamaliel SICK, IDEACLOUD.
*
* For the full copyright and license information, please view the LICENSE
* file that was distributed with this source code.
*/

'use strict'

const { promisify } = require('util')
const { redisClient } = require('../../../module/redis_client')
const router = require('koa-router')()

module.exports = router

router.post('postContent', '/', async ctx => {
    const body = ctx.request.body

    // Simulating the primary key generation
    const next_key = await redisClient.incr('next_key')
    // Storing data
    body.id = next_key
    await redisClient.set(next_key, JSON.stringify(body))

    ctx.status = 201
    ctx.body = body
})

router.get('getContent', '/:id', async ctx => {
    const { id } = ctx.params

    const body = await redisClient.get(id)

    if(body) {
      ctx.status = 200
      ctx.body = JSON.parse(body)
    } else {
      ctx.status = 404
    }
})
