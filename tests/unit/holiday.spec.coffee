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
    @page.onConsoleMessage = (msg) ->
      msg.should.equal 'false'
      done()
    @page.evaluate ->
      Holidays.insert {name: 'Denied'}, (error, result) ->
        console.log result
    , (error, result) ->

  it 'should deny direct update from client', (done) ->
    @page.onConsoleMessage = (msg) ->
      msg.should.equal 'false'
      done()
    @page.evaluate ->
      Holidays.update 1, {name: 'Denied'}, (error, result) ->
        console.log result
    , (error, result) ->

  it 'should deny direct remove from client', (done) ->
    @page.onConsoleMessage = (msg) ->
      (msg is 'false' or msg is 'undefined').should.be.true
      done()
    @page.evaluate ->
      Holidays.remove 1, (error, result) ->
        console.log result
    , (error, result) ->

  after ->
    @phantom.exit()
