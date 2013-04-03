phantom = require 'node-phantom'
Q = require 'q'

exports.phantomCreatePage = (uri) ->
  deferred = Q.defer()
  phantom.create (error, ph) ->
    if error isnt null
      deferred.reject(error)
    else
      ph.createPage (error, page) ->
        if error isnt null
          deferred.reject(error)
        else
          page.open uri, (error, status) ->
            if error isnt null
              deferred.reject(error)
            else
              deferred.resolve({page: page, phantom: ph})
  return deferred.promise
