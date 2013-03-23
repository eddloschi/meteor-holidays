Template.calendar.currentMonthName = ->
  moment(Session.get('currentDate')).format('MMM')

Template.calendar.currentYear = ->
  moment(Session.get('currentDate')).format('YYYY')

Template.calendar.events
  'click #increase' : (e,t) ->
      Session.set('currentDate', moment(Session.get('currentDate')).add('months', 1).format('YYYY-MM-DD'))

  'click #decrease' : (e,t) ->
      Session.set('currentDate', moment(Session.get('currentDate')).subtract('months', 1).format('YYYY-MM-DD'))

# Template.calendar.currentMonthName = ->
#   i18n.ptBr.monthShorts[Session.get('currentMonth')]

# Template.calendar.currentYear = ->
#   Session.get 'currentYear'

# Template.calendar.weekDays = ->
#   i18n[Session.get('locale')].weekDays

# Template.calendar.firstDay = ->
#   new Date(Session.get('currentYear'), Session.get('currentMonth'), 1).getDay()

# Template.calendar.monthDays = ->
#   new Date(Session.get('currentYear'), Session.get('currentMonth') + 1, 0).getDate()

# Template.calendar.events
#   'click .month-day' : (e, t) ->
#     Session.set('showDayView', true)
#     Session.set('selectedDate', e.target.date)
#   ,
#   'click .month-title .decrease': (e,t) ->
#     previousMonth = Session.get('currentMonth') - 1

#     if previousMonth < 0
#       previousMonth = 11
#       Session.set('currentYear', Session.get('currentYear') - 1)

#     Session.set('currentMonth', previousMonth)
#   ,
#   'click .month-title .increase': (e,t) ->
#     nextMonth = Session.get('currentMonth') + 1

#     if nextMonth > 11
#       nextMonth = 0
#       Session.set('currentYear', Session.get('currentYear') + 1)

#     Session.set('currentMonth', nextMonth)
