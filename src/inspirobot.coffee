# Description
#  Inspirational quotes for Hubot
#
# Commands:
#  hubot inspire me - Give some inspiration
#
# Author:
#  Zeger Van de Vannet

superagent = require 'superagent'

module.exports = (robot) ->
  robot.respond /inspire me/i, (response) ->
    robot.http('https://inspirobot.me/api?generate=true')
      .get() (err, res, body) ->
        if err
          response.reply "Something went wrong, hang in there..."
          return 0
        response.reply body

# vim:sw=2:et:ts=2:fdm=marker
