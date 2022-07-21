# Simple list implemented in MIPS Assembly
This is the implementation of a simple list in MIPS Assembly. The easiest way of testing is to run it on a simulator such as [QTSpim](http://spimsimulator.sourceforge.net). 

The list utilizes a space of exactly 600 bytes in the memory of MIPS, and it can store at most 100 nodes. Each node consists of a 16-bit ID which gets values from 0 to (2<sup>16</sup>-1), and a 32-bit word which gets values from (-2<sup>31</sup>+1) to (2<sup>31</sup>-1). 

> **Note**  
> The ID of every node has to be unique, otherwise some operations may not work properly.

When the program starts, it asks for the initial size of the list, and an integer number from 1 to 100 has to be given. Afterwards, all nodes have to be initialized from the user before the list is ready to be used. 

> **Warning**  
> Setting out-of-bounds values for a 32-bit word may cause overflow issues.

After the list has been initialized successfully, a multiple choice menu appears:
- The 1st option allows for a new node to be added at the end of the list.
- The 2nd option allows for the last node of the list to be deleted.
- The 3rd option allows to print the contents of a node (position in the list, ID and integer value).
- The 4th option allows to print the current size of the list.
- The 5th option allows to print the contents of the node with the minimum integer value.
- The 6th option allows to print the factorial of a node's integer value. However if the factorial is greater than (2<sup>31</sup>-1), overflow issues may occur. 
  > **Note**  
  When the integer value of a node is zero or negative, its factorial is returned to be equal with 1.
- The 7th option just terminates the program.
