Holidays = new Meteor.Collection('holidays')

Holidays.allow
  insert: (userId, doc) ->
    false
  update: (userId, doc, fields, modifier) ->
    false
  remove: (userId, doc) ->
    false
