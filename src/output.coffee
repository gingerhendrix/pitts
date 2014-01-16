exports.Output = class Output
  constructor: ->
    
  connect: (@input) ->
    @inhibiting = false

  inhibit: (@input) ->
    @inhibiting = true

  value: ->
    if @inhibiting
      if @input.value() is 0 then 1 else 0
    else
      @input.value()
