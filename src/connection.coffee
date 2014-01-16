exports.Connection = class Connection
  constructor: (@input, @output) ->
    @_value = 0

  value: ->
    @input.value()
