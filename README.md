The Enigma project can take a message in the form of a string and encode it using Enigma encryption algorithm which requires a randomingly generated 5 digit number and a date. It can also decode a message by reversing the Enigma algorithm.

My assessment: 3.6

Functionality: 3
It can encode and decode messages and use the command line to do so.

Object Oriented Programming: 4
I created several additional classes (Key, Offset, Shift) so that should we want to change how any aspect of the algorithm works we do so by adjusting any single class element.
I also created a mixin module called Cryptable that has methods common to both the Encrypt and Decrypt classes; thereby drying up my code.

Ruby Conventinos and Mechanics: 4
All of my methods are less than 10 lines and most are only that long for readability. My variable names attempt to describe the element rather than generally named.  I don't think I use each anywhere - trying to use the most efficient enumerable.

Test Driven Development: 3
I have 100% coverage and git history will indicate I wrote tests before methods.
I tried to use mocks/stubs but couldn't figure it out.

Version Control: 4
I used several branches to create the project - encrypt, decrypt, refactor and committed regularly on each branch.  I merged one branch into my main locally and pushed that up.  The other I pushed the branch to git hub and the created a pull request to move into main.
