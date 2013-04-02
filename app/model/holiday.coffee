Holidays = new Meteor.Collection('holidays')

Holidays.allow
  insert: (userId, doc) ->
    false
  update: (userId, doc, fields, modifier) ->
    false
  remove: (userId, doc) ->
    false

if Meteor.isClient
  Holidays.insert = (userId, doc) ->
    false
  Holidays.update = (userId, doc, fields, modifier) ->
    false
  Holidays.remove = (userId, doc) ->
    false
