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

@pixel_register // This address holds either 0(clear 16 pixels) or -1(black 16 pixels)

(check_keyboard)
  @KBD // set the address to the keyboard register
  D=M // store the currently pressed key in D
  @clear_screen // set the address to clear screen instruction
  D;JEQ // if no key is pressed (0) go to clear screen
  @black_screen
  0;JMP // Otherwise black the screen

(black_screen)
  @pixel_register
  M=-1 // Set the pixel register to -1 (all black pixels)
  @paint_screen
  0;JMP // Goto paint_screen

(clear_screen)
  @pixel_register
  M=0 // Set the pixel register to 0 (all clear pixels)
  @paint_screen
  0;JMP // Goto paint_screen

(paint_screen)
  // Paints the whole screen with colors as defined in pixel_register

  // The screen holds 8192 registers and we need to iterate over all of them
  @i // address of the number of left iterations
  M=8192 // At the beggining we have 8192 iterations left

  @current_screen_register // holds the address of the current screen register
  M=@SCREEN // Assign the first screen register to the current_screen_register

  (loop)

    // Check if the number of iterations left is 0 and if so finish
    @i
    D=M
    @finish
    D;JEQ

    // If its not equal assign the value under pixel_register to current_screen_register
    @pixel_register
    D=M
    @current_screen_register
    M=D

    // Increment current_screen_register
    @current_screen_register
    M=M+1

  (finish)
    // Finish and go back to checking keyboard
    @check_keyboard
    0;JMP
