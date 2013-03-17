Meteor.startup ->
  require = __meteor_bootstrap__.require
  path = require 'path'
  fs = require 'fs'
  base = path.resolve '.'
  isBundle = fs.existsSync "#{base}/bundle/"
  modulePath = "#{base}#{if isBundle then '/bundle/static' else '/public'}/node_modules"

  global.later = require "#{modulePath}/later"
