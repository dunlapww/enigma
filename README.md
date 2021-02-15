## Project Enigma
The Enigma project is an encryption/decryption algorithm similar to the one used by Germany in WWII to send messages to its troops. The algorithm was eventually cracked by Alan Turing and his 'Enigma' machine.  
- This project takes a message as a string and encrypts it, and provides the encrypter with a 'key' and 'date' used to encrypt the message.
- The project can then decrypt the message to its original form using the provided key and date.
- Alternatively, there is a 'crack' algorithm that, if given the date of the encoded message, determines the key and decrypts the message.

To try out this project, do the following:

1. Fork this repository and clone it locally
2. Enter a message in the 'message.txt' file that you want to encrypt
  - If you want to later crack this message, make sure your message ends with " end" (Alan Turing was able to crack the algorithm partially because the allied forces realized all Nazi communications ended with the word 'end'). This 'crack' algorithm, uses that same assumption.
3. To encrypt the message type the following in the terminal:
```
ruby ./lib/encrypt_runner.rb message.txt encrypted.txt
=> Created encrypted.txt with the key 94327 and date 250920
```

4. To decrypt this message type the following into the terminal (use the key and date output above):
```
ruby ./lib/decrypt_runner.rb encrypted.txt decrypted.txt 94327 250920
=> Created decrypted.txt with the key 94327 and date 250920
```

5. To run the crack algorithm, make sure your message.txt ends in " end" and provide the date the date used to encrypt the message.  This will figure out the key that was used:
```
ruby ./lib/crack_runner.rb encrypted.txt decrypted.txt 250920
=> Created decrypted.txt with the cracked key 67054 and date 250920
```
Note, that on occasion there is more than one key that will crack the message. So the key returned may not match the one used to encode the message.

### My assessment: 4 out of 4

#### Functionality: 4
It can encode, decode, and crack messages and use the command line to do so.

#### Object Oriented Programming: 4
I created several additional classes (Key, Offset, Shift) so that should we want to change how any aspect of the algorithm works we do so by adjusting any single class element.
I also created a mixin module called Cryptable that has methods common to both the Encrypt and Decrypt classes; thereby drying up my code.

#### Ruby Conventions and Mechanics: 4
All of my methods are less than 10 lines and most are only that long for readability. My variable names attempt to describe the element rather than generally named.  I don't think I use each anywhere - trying to use the most efficient enumerable.

#### Test Driven Development: 4
I have 100% coverage according to simplecov when I use rake.  And git history will indicate I wrote tests before methods.
I used stubs to make sure the random number and todays date would format correctly.

#### Version Control: 4
I comitted regularly and used several branches to create the project - encrypt, decrypt, refactor, wd_crack.  Branches were pushed up to GitHub and then merged into main.
