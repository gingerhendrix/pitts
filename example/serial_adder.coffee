
Pitts = require '../src/index.coffee'
Example = require './helper.coffee'

console.log "\nSerial Adder\n"

n = new Pitts.Network()
input_a = n.addInput [0,0,1,1,1]
input_b = n.addInput [1,0,0,0,1]

node1_a = n.addNeuron 1
node1_b = n.addNeuron 2 
node1_c = n.addNeuron 3 

#Inputs
n.connect(input_a, node1_a)
n.connect(input_b, node1_a)
n.connect(input_a, node1_b)
n.connect(input_b, node1_b)
n.connect(input_a, node1_c)
n.connect(input_b, node1_c)

#Carry
n.connect node1_b, node1_a
n.connect node1_b, node1_b
n.connect node1_b, node1_c

#Level 2
node2_a = n.addNeuron 1
node2_b = n.addNeuron 1 

n.connect node1_a, node2_a
n.inhibit node1_b, node2_a
n.connect node1_c, node2_b

#Level 3
node3_a = n.addNeuron 1
n.connect node2_a, node3_a
n.connect node2_b, node3_a

output = n.addOutput()
n.connect node3_a, output

Example.run n,16 
