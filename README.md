# McCulloch Pitts Neurons

This library implements simple threshold logic in the style of
McCulloch-Pitts Neurons.
The function of the neurons and the examples are dervied from the book
Computation: Finite and Infinite Machines by Marvin Minsky.

## Example

A simple latch.  This network will continue to output a 1 after (t+1) the
first 1 appears in the input.  An additional reset input will return the
network to a quiescent state.

    n = new Pitts.Network()

    input = n.addInput [0,0,1,0, 0]
    reset = n.addInput [0,0,0,0,0,0,1]
    node_a = n.addNeuron 1
    output = n.addOutput()

    n.connect(input, node_a)
    n.inhibit(reset, node_a)

    n.connect(node_a, node_a)
    n.connect(node_a, output)

More examples found under examples/


License: BSD
