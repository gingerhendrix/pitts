Pitts = require '../src/index.coffee'
Example = require './helper.coffee'

console.log "\nBinary Scaler\n"

n = new Pitts.Network()

input = n.addInput [0,0,1,0,0,1,1,1,1,1]
reset = n.addInput []
node_a = n.addNeuron 1
node_b = n.addNeuron 2 
node_c = n.addNeuron 2 

#output_a = n.addOutput()
output_b = n.addOutput()
#output_c = n.addOutput()

n.connect(input, node_a)
n.connect(input, node_b)
n.connect(input, node_c)

n.inhibit(reset, node_a)
n.inhibit(reset, node_b)
n.inhibit(reset, node_c)

n.connect(node_a, node_a)
n.connect(node_a, node_b)

n.inhibit(node_b, node_b)
n.inhibit(node_b, node_a)
n.connect(node_b, node_c)

n.connect(node_c, node_a)
n.connect(node_c, node_b)

#n.connect(node_a, output_a)
n.connect(node_b, output_b)
#n.connect(node_c, output_c)

Example.run(n, 10)


console.log "\nK-Ary Counter\n"

binary_scaler = (n, input, reset) ->
  node_a = n.addNeuron 1
  node_b = n.addNeuron 2 
  node_c = n.addNeuron 2 


  n.connect(input, node_a)
  n.connect(input, node_b)
  n.connect(input, node_c)

  n.inhibit(reset, node_a)
  n.inhibit(reset, node_b)
  n.inhibit(reset, node_c)

  n.connect(node_a, node_a)
  n.connect(node_a, node_b)

  n.inhibit(node_b, node_b)
  n.inhibit(node_b, node_a)
  n.connect(node_b, node_c)

  n.connect(node_c, node_a)
  n.connect(node_c, node_b)

  return [node_a, node_b, node_c]


n = new Pitts.Network()
input = n.addInput ((1) for _ in [0..60])
reset = n.addInput []
for k in [0..3]
  #output = n.addOutput()
  [scaler_a, scaler_b] = binary_scaler(n, input, reset)
  #n.connect(scaler_b, output)
  input = scaler_b

output = n.addOutput()
n.connect(scaler_b, output)

Example.run(n, 60)

