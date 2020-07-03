/*
* This file is part of the "mynotes-svc" project.
*
* Copyright (C) 2020 - Gamaliel SICK, IDEACLOUD.
*
* For the full copyright and license information, please view the LICENSE
* file that was distributed with this source code.
*/

'use strict'

const Koa = require('koa')
const bodyParser = require('koa-bodyparser')

const { redisClient } = require('../module/redis_client')

const api = new Koa()

api.use(bodyParser())
api.use(require('./v1').routes())

async function main() {
    try {
        await redisClient.set('next_key', 0)

        const port = process.env.PORT
        api.listen(port, '0.0.0.0')

        console.log(`app started. Listening on port ${port}`)
    } catch (error) {
        console.log("couldn't start application", { error })
        process.exit(1)
    }
}

main()
