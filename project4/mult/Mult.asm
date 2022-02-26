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

//1. assign iterator as 1
@i
M=1

// check which is higher between RO and R1
@R0
D=M;

@R1
D=D-M;

//if R1 is higher jump
@assignment2
D;JLT

//if R0 is higher
//set R0 as a factor to be added to itself for R1 times
//and then proceed to loop. This is done for optimization
@R0
D=M 
@x 
M=D

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
D;JGT

//access mult variable
@mult 
D=M

//add the value of x to the value of mult
@x
D=D+x

//update the value of mult with new value
@mult
M=D

//update the iterator for the next step
@i
M=M+1

//loop for the next step
@loop
0;JMP



(stop)
@mult 
D=M 

@R2 
M=D 

(end)
@end 
0; JMP

(assignment2)
//as R1 is higher set R1 as a factor to be added to itself for R0 times
//and then proceed to loop. This is done for optimization
@R0
D=M
@n
M=D

@R1 
D=M
@x
M=D

@loop
0;JMP