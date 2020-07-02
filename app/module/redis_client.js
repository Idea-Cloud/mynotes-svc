/*
* This file is part of the "mynotes-svc" project.
*
* Copyright (C) 2020 - Gamaliel SICK, IDEACLOUD.
*
* For the full copyright and license information, please view the LICENSE
* file that was distributed with this source code.
*/

'use strict'

const util = require('util')
const redis = require('redis')

exports.ClientFactory = {
    createClient: () => {
        const client = redis.createClient(6379, 'redis', {})

        client.on('error', function(err) {
            console.log('redis', 'Create redis client fail', { name: 'redis', error: err })
        })

        const get = util.promisify(client.get).bind(client)
        const set = util.promisify(client.set).bind(client)
        const incr = util.promisify(client.incr).bind(client)

        return {
            get,
            set,
            incr,
            quit: () => {
                client.quit()
            }
        }
    }
}

const redisClient = exports.ClientFactory.createClient()

exports.redisClient = redisClient
