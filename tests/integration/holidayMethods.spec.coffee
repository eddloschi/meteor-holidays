phantomCreatePage = require('../helper/specHelper').phantomCreatePage
chai = require 'chai'
should = chai.should()

describe 'holiday methods', ->

  before (done) ->
    phantomCreatePage('http://localhost:3000/').then (value) =>
      @page = value.page
      @phantom = value.phantom
      done()
    , (error) ->
      throw error

  describe 'createHoliday', =>

    it 'should create a holiday with a day and a month', (done) ->
      name = 'Christmas'
      @page.onConsoleMessage = (msg) =>
        @page.evaluate (id) ->
          Holidays.findOne id
        , (error, result) ->
          should.exist result
          result.name.should.equal name
          done()
        , msg
      @page.evaluate (name) ->
        holiday =
          name: name
          schedule: recur().on(25).dayOfMonth().on(12).month()
        Meteor.call 'createHoliday', holiday, (error, result) ->
          console.log result
      , (error, result) ->
      ,
      name

  after ->
    @phantom.exit()