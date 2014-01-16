Neuron = require('./Neuron').Neuron
Input = require('./Input').Input
Output = require('./Output').Output 
Connection = require('./Connection').Connection

exports.Network = class Network
  constructor: ->
    @neurons = []
    @inputs = []
    @outputs = []
    @connections = []
    @t = 0

  addNeuron: (threshold) ->
    neuron = new Neuron(threshold)
    @neurons.push neuron
    neuron
 
  addInput: (values) ->
    input = new Input(values)
    @inputs.push input
    input

  addOutput: ->
    output = new Output()
    @outputs.push output
    output

  connect: (input, output) ->
    connection = new Connection(input, output)
    @connections.push connection
    output.connect connection
    connection

  inhibit: (input, output) ->
    connection = new Connection(input, output)
    @connections.push connection
    output.inhibit connection
    connection

  next: ->
    neuron.next() for neuron in @neurons
    @t++
    neuron.commit() for neuron in @neurons
    input.next() for input in @inputs
    @output()

  output: ->
    return (output.value() for output in @outputs)

  input: ->
    return (input.value() for input in @inputs)

