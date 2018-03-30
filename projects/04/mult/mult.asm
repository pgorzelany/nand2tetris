// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
@R0
D=M // Get value from register 0 (first number)
@i // memory address that holds the how many iterations are left
M=D // initialize i it to the value in R0
@R2 // memory address that holds the result that will eventually be stored in R2
M=0 // initialize it to 0
(LOOP)
  @i // Set address to number of iterations
  D=M // Store number of iterations in D
  @END // Set address to the end address
  D;JEQ // If D == 0 then go to end

  // Otherwise add the number in register 1

  @R1 // Set address to register 1
  D=M // Store the value in register 1
  @R2 // Set address to result
  M=M+D // Add value in D to result

  // And decrement i
  @i
  M=M-1

  // Next iteration
  @LOOP
  0;JMP

(END)
  @end
  0;JMP
