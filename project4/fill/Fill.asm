// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

//initialize counter variable
@8192
M=A 
D=M 
@n 
M=D

//check the status of keyboard, if pressed implement fill, else implement reset
(stop)
@KBD
D=M 

@fill
    D;JGT
@reset
    D;JEQ


//fill while D is greater than Zero. 
(fill)
//initialize or reset iterator
@i 
    M=1

@16383 
    M=A
    D=M 

@n
    A=D+M
    D=M

@stop 
    D;JLT

(fillloop)
    @i 
    D=M;

@n
D=D-M;

@stop
D;JGT
//the above six lines checks if the iteration is complete and implement a jump to stop
//or continue with loop.


//access the base screen value
@16383 
D=M 

//use screen value and current value of i as pointer to the next screen bit to be updated
@i 
A=D+M 
//update the 16-bit screen value to -1(1111111111111111), all  black bits
M=M-1

//increment the iterator
@i 
M=M+1

//restart fillloop
@fillloop 
0;JMP


(reset)
@i 
M=1

@16383 
M=A
D=M 

@n
A=D+M
D=M

@stop 
D;JEQ

//else continue loop. 
(reset)

//initialize or reset iterator
@i 
M=1

(resetloop)
@i 
D=M;

@n
D=D-M;

@stop
D;JGT
//the above six lines checks if the iteration is complete and implement a jump to stop
//or continue with loop.

//access the base screen value
@16383 
D=M 
//use screen value and current value of i as pointer to the next screen bit to be updated
@i 
A=D+M 

//update the 16-bit screen value to 0(0000000000000000), all  "white" bits
M=0

//increment the iterator
@i 
M=M+1

//restart the resetloop
@resetloop 
0;JMP