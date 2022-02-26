// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

//initialize iterator as 0
@i
M=0

//initialize multiplication factor as 0
@mult
M=0

//reset result at R2
@R2
M=0


//set R0 as a factor (x) to be added to itself for R1 times
@R0
D=M
@x
M=D

//set R1 as a factor n for number of iteration
@R1
D=M
@n
M=D

(loop)
//check if i is equal to n
@i
D=M

@n
D=D-M

//if i is greater then n, stop the loop else continue
@stop
D;JEQ

//access mult variable
@mult
D=M

//add the value of x to the value of mult
@x
D=D+M

//update the value of mult with new value
@mult
M=D

//update the iterator for the next step
@i
M=M+1

//loop for the next step
@loop
0;JMP


//at stop, assign mult value to R2 which is where result is to be saved
(stop)
@mult
D=M

@R2
M=D

(end)
@end
0; JMP
