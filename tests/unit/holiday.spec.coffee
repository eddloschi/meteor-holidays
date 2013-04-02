Browser = require 'zombie'
chai = require 'chai'
should = chai.should()

describe 'holiday model', ->

  before (done) ->
    @browser = new Browser()
    @browser.visit('http://localhost:3000/').then done, done

  it 'should deny direct insert from client', ->
    @browser.window.Holidays.insert({name: "Denied"}).should.equal(false)

  it 'should deny direct update from client', ->
    @browser.window.Holidays.update({}, {name: "Denied"}).should.equal(false)

  it 'should deny direct remove from client', ->
    @browser.window.Holidays.remove({}).should.equal(false)
