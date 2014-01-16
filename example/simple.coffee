
Pitts = require '../src/index.coffee'
Example = require './helper.coffee'

console.log "\nNo Nodes\n"

n = new Pitts.Network()

input = n.addInput [1,0,1,1]
output = n.addOutput()
n.connect(input, output)

Example.run(n, 10)

console.log "\nSingle Node Delay\n"

n = new Pitts.Network()

input = n.addInput [1,0,1,1]
node_a = n.addNeuron 1
output = n.addOutput()
n.connect(input, node_a)
n.connect(node_a, output)

Example.run(n, 10)

console.log "\nDouble Node Delay\n"

n = new Pitts.Network()

input = n.addInput [1,0,1,1]
node_a = n.addNeuron 1
node_b = n.addNeuron 1
output = n.addOutput()

n.connect(input, node_a)
n.connect(node_a, node_b)
n.connect(node_b, output)

Example.run(n, 10)

console.log "\nFeedback\n"

n = new Pitts.Network()

input = n.addInput [0,0,1,0, 0]
node_a = n.addNeuron 1
output = n.addOutput()

n.connect(input, node_a)
n.connect(node_a, node_a)
n.connect(node_a, output)

Example.run(n, 10)

console.log "\nFeedback With Reset\n"

n = new Pitts.Network()

input = n.addInput [0,0,1,0, 0]
reset = n.addInput [0,0,0,0,0,0,1]
node_a = n.addNeuron 1
output = n.addOutput()

n.connect(input, node_a)
n.inhibit(reset, node_a)

n.connect(node_a, node_a)
n.connect(node_a, output)

Example.run(n, 10)
