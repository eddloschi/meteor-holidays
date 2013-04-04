Meteor.methods
  createHoliday: (holiday) ->
    holiday ?= {}
    if typeof holiday.name isnt 'string' or typeof holiday.schedule isnt 'object'
      throw new Meteor.Error 400, 'Required Parameters Missing'
    return Holidays.insert(holiday)
