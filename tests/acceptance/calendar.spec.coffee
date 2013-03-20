Browser = require 'zombie'
chai = require 'chai'
should = chai.should()

describe 'calendar view', ->
  before (done) ->
    @browser = new Browser()
    @browser.visit('http://localhost:3000/').then done, done

  it 'should return 200 ok', ->
    @browser.success.should.equal(true)

  it 'should have a calendar', ->
    should.exist @browser.query("#calendar-id")
