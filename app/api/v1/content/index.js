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

    const next_key = await redisClient.incr('next_key')
    await redisClient.set(next_key, JSON.stringify(body))

    ctx.status = 201
    ctx.body = Object.assign({}, body, { id: next_key })
})

router.get('getContent', '/:id', async ctx => {
    const { id } = ctx.params

    const body = await redisClient.get(id)
    console.log(body)

    if(body) {
      ctx.status = 200
      ctx.body = JSON.parse(body)
    } else {
      ctx.status = 404
    }
})
