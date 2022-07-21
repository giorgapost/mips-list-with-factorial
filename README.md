# Simple list implemented in MIPS assembly
This is the implementation of a simple list in MIPS assembly. The easiest way for testing is to run it on a simulator such as [QTSpim](http://spimsimulator.sourceforge.net).

When the program starts, it asks for the size of the list, and an integer number greater than 0 has to be given. Afterwards, all nodes have to be initialized from the user before the list is ready to be used. Each node consists of an integer ID which gets values from 0 to (2<sup>16</sup>-1), and an integer value which gets values from (-2<sup>31</sup>+1) to (2<sup>31</sup>-1). Setting out-of-bounds values for the above variables may cause overflow issues. What is more, the ID of every node has to be unique, otherwise that node may not be discoverable.

After the list has been initialized, a multiple choice menu appears:
- 1st option allows for a new node to be added at the end of the list.
- 2nd option allows for the last node of the list to be deleted.
- 3rd option allows to print the contents of a node (position in the list, ID and integer value).
- 4th option allows to print the current size of the list.
- 5th option allows to print the contents of the node with the minimum integer value.
- 6th option allows to print the factorial of a node's integer value. However if the factorial is greater than (2<sup>31</sup>-1), overflow issues may occur. Notice that when the integer value of a node is zero or negative, its factorial is returned to be equal with 1.
- 7th option just terminates the program.
