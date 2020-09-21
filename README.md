The Enigma project can take a message in the form of a string and encode it using Enigma encryption algorithm which requires a randomingly generated 5 digit number and a date. It can also decode a message by reversing the Enigma algorithm.

My assessment: 3.8

Functionality: 3.25
It can encode and decode messages and use the command line to do so. I tried for 3 hours to solve crack, created a class and some tests and methods, but couldn't solve it (all on branch wd_crack)

Object Oriented Programming: 4
I created several additional classes (Key, Offset, Shift) so that should we want to change how any aspect of the algorithm works we do so by adjusting any single class element.
I also created a mixin module called Cryptable that has methods common to both the Encrypt and Decrypt classes; thereby drying up my code.

Ruby Conventinos and Mechanics: 4
All of my methods are less than 10 lines and most are only that long for readability. My variable names attempt to describe the element rather than generally named.  I don't think I use each anywhere - trying to use the most efficient enumerable.

Test Driven Development: 4
I have 100% coverage according to simplecov when I use rake.  And git history will indicate I wrote tests before methods.
I used stubs to make sure the random number and todays date would format correctly.

Version Control: 4
I used several branches to create the project - encrypt, decrypt, refactor, wd_crack and committed regularly on each branch.  I merged one branch into my main locally and pushed that up.  All other times I pushed the branch to git hub and then created a pull request to move into main.
