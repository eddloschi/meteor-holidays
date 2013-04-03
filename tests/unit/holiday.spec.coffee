phantomCreatePage = require('../helper/specHelper').phantomCreatePage
chai = require 'chai'
util = require 'util'
should = chai.should()

describe 'holiday model', ->

  before (done) ->
    phantomCreatePage('http://localhost:3000/').then (value) =>
      @page = value.page
      @phantom = value.phantom
      done()
    , (error) ->
      throw error

  it 'should deny direct insert from client', (done) ->
    @page.evaluate ->
      Holidays.insert {name: 'Denied'}, (error, result) ->
        should.not.exist error
        result.should.be.false
        done()

  it 'should deny direct update from client'

  it 'should deny direct remove from client'

  after ->
    console.log 'after'
    @phantom.exit()
