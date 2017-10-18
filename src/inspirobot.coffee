# Description
#  Inspirational quotes for Hubot
#
# Commands:
#  hubot inspire me - Give some inspiration
#
# Author:
#  Zeger Van de Vannet



module.exports = (robot) ->
  robot.respond /inspire me/i, (res) ->
    robot.http('http://inspirobot.me/api?generate=true')
      .get() (err, res, body) ->
        if err
          res.reply "Something went wrong, hang in there..."
        res.repy body

# vim:sw=2:et:ts=2:fdm=marker
