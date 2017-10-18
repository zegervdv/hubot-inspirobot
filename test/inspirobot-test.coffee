expect = require('chai').expect
nock = require 'nock'
co = require 'co'

pretend = require 'hubot-pretend'

describe 'inspirobot', =>
   beforeEach =>
      nock('http://inspirobot.me')
         .get '/api'
         .query { generate: 'true' }
         .reply 200, 'http://generated.inspirobot.me/069/aXm9277xjU.jpg'
      pretend.read './src/inspirobot.coffee'
      pretend.start()
      @alice = pretend.user 'alice'

   afterEach =>
      pretend.shutdown()

   it 'responds with a URL', =>
      co =>
         yield @alice.send 'hubot inspire me'
         result = yield pretend.observer.next()
         expect(result.value[1]).to.include 'http://generated.inspirobot.me/069/aXm9277xjU.jpg'

