Browser = require 'zombie'
chai = require 'chai'
should = chai.should()

describe 'calendar view', ->
  before (done) ->
    @browser = new Browser()
    @browser.visit('http://localhost:3000/').then done, done

  it 'should return 200 ok', ->
    @browser.success.should.equal(true)

  it 'should have a calendar-id div', ->
    should.exist @browser.query('#calendar-id')

  it 'should show the present year and month on startup', ->
    presentMonth = @browser.evaluate('moment().format("MMM")')
    @browser.text('#month-id').should.equal(presentMonth)
    presentYear = @browser.evaluate('moment().format("YYYY")')
    @browser.text('#year-id').should.equal(presentYear)

  it 'should show days of the current selected month and have enabled or disabled css class ', ->
    currentDate = @browser.evaluate('Session.get("currentDate")')
    @browser.evaluate("var currentDay = moment('#{currentDate}').startOf('month')")
    currentMonth = @browser.evaluate("currentDay.month()")
    rows = @browser.evaluate('(currentDay.day() + moment(currentDay).endOf("month").date() <= 35) ? 4 : 5')
    @browser.evaluate('currentDay.subtract("days", currentDay.day())')
    for row in [0..rows]
      for col in [0..6]
        @browser.text("##{row}-#{col}").should.equal("#{@browser.evaluate('currentDay.date()')}")

        if currentMonth is @browser.evaluate('currentDay.month()')
          console.log("t")
          @browser.evaluate("$('##{row}-#{col}').hasClass('enabled')").should.equal(true)
          @browser.evaluate("$('##{row}-#{col}').hasClass('disabled')").should.equal(false)
        else
          @browser.evaluate("$('##{row}-#{col}').hasClass('disabled')").should.equal(true)
          @browser.evaluate("$('##{row}-#{col}').hasClass('enabled')").should.equal(false)

        @browser.evaluate('currentDay.add("days", 1)')

  describe 'user interaction', =>

    beforeEach ->
      @currentDate = @browser.evaluate('Session.get("currentDate")')

    it 'should increase month when the increase button clicked', ->
      element = @browser.query('#increase')
      @browser.fire 'click', element, =>
        increasedMonth = @browser.evaluate("moment('#{@currentDate}').add('months', 1).format('MMM')")
        @browser.text('#month-id').should.equal(increasedMonth)

    it 'should decrease month when the decrease button clicked', ->
      element = @browser.query('#decrease')
      @browser.fire 'click', element, =>
        decreasedMonth = @browser.evaluate("moment('#{@currentDate}').subtract('months', 1).format('MMM')")
        @browser.text('#month-id').should.equal(decreasedMonth)
