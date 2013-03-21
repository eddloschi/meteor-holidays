Meteor.startup ->
    Session.set('currentDate', moment().format("YYYY-MM-DD"))
