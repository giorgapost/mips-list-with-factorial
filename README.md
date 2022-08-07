# Simple list implemented in MIPS Assembly

This is the implementation of a simple list for [MIPS processor](https://en.wikipedia.org/wiki/MIPS_architecture), in assembly.
What is more, the capability of providing the factorial for every entry of the list is also offered.

## Table of Contents

- [Description](#description)
- [Compilation and execution instructions](#compilation-and-execution-instructions)
- [Usage](#usage)
- [Status](#status)
- [License](#license)
- [Authors](#authors)

## Description
The list utilizes a space of exactly 600 bytes in the memory of MIPS, and it can store at most 100 nodes.
Each node consists of a 16-bit `ID` which gets values from 0 to (2<sup>16</sup>-1) in the decimal system,
and a 32-bit `word` which gets values from (-2<sup>31</sup>+1) to (2<sup>31</sup>-1) in the decimal system again. 

> **Note**  
> The `ID` of every node has to be unique, otherwise some operations may not work properly.

## Compilation and execution instructions

The easiest way of compiling and running the source code is to utilize a simulator such as [QTSpim](http://spimsimulator.sourceforge.net). 

## Usage

When the program is executed, it asks for the initial size of the list, and an integer number
from 1 to 100 has to be given. Afterwards, all nodes have to be initialized from the user
with an `ID` and a `word` before the list is ready to be used. Notice that setting out-of-bounds
values for an `ID` will not be accepted by the program.

> **Warning**  
> Variables `ID` and `word` are initialized by providing their values as decimal integers.
Setting out-of-bounds values for a `word` may cause overflow issues.

After the list has been initialized successfully, a multiple choice menu appears in the console:
- The 1st option allows for a new node to be added at the end of the list (after being initialized by the user).
- The 2nd option allows for the last node of the list to be deleted.
- The 3rd option allows to print the contents of a node (position in the list, `ID` and `word`, all converted to decimal integers).
- The 4th option allows to print the current size of the list.
- The 5th option allows to print the contents of the node with the minimum `word`.
- The 6th option allows to print the factorial of a node's integer `word` (as a decimal integer).
However, if the factorial is greater than (2<sup>31</sup>-1), overflow issues may occur and the printed number may be incorrect.
  > **Note**  
  When the `word` of a node is zero or negative, its factorial is returned to be equal with 1.
- The 7th option just terminates the program.

## Status

Under maintenance.

## License

Distributed under the GPL-3.0 License. See [`LICENSE`](LICENSE) for more information.

## Authors

[Georgios Apostolakis](https://www.linkedin.com/in/giorgapost)
