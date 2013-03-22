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
    should.exist @browser.query('#calendar-id')
    @browser.evaluate('$("#month-view td").length').should.equal(42)

  it 'should show the present year and month on startup', ->
    presentMonth = @browser.evaluate('moment().format("MMM")')
    @browser.text('#month-id').should.equal(presentMonth)
    presentYear = @browser.evaluate('moment().format("YYYY")')
    @browser.text('#year-id').should.equal(presentYear)

  describe 'user interaction', =>

    beforeEach ->
      @currentDate = @browser.evaluate('Session.get("currentDate")')

    it 'should increase month when the increase button clicked', ->
      element = @browser.query('#increase')
      @browser.fire 'click', element, =>
        increasedMonth = @browser.evaluate("moment('#{@currentDate}').add('months', 1).format('MMM')")
        @browser.text('#month-id').should.equal(increasedMonth)
