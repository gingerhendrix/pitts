exports.Neuron = class Neuron
  constructor: (@threshold) ->
    @_value = 0
    @inputs = []
    @inhibitors = []

  next: ->
    sum = 0
    (sum += inhibitor.value()) for inhibitor in @inhibitors
    if sum > 0
      return @_new_value = 0

    sum = 0
    (sum += input.value()) for input in @inputs
    if sum >= @threshold
      @_new_value = 1
    else
      @_new_value = 0

  commit: ->
    @_value = @_new_value

  connect: (input) ->
    @inputs.push input

  inhibit: (input) ->
    @inhibitors.push input

  value: ->
    @_value

 
