chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'di', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()

    require('../src/di')(@robot)

  it 'registers a respond listener', ->
    expect(@robot.respond).to.have.been.calledWith(/di\s*(?:me)?\s*(.+)?/i)
