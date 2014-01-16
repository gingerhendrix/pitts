exports.Input = class Input
  constructor: (@_values) ->
    @_value = @_values.shift()

  next: ->
    return @_value = 0 if @_values.length is 0
    @_value = @_values.shift()

  value: ->
    @_value
