// EECE3324 
// Computer Architecture
// Final Project
// Kevin Wong & Jonathan Marrero

// Module for ShiftLeft2PC

// Jump address target is the result of shifting the lower 26 bits of jump instruction
// left by 2 bits. Concatenate the upper 4 bits of PC+4.
// Result is 32-bit address


`timescale 1ns/1ns

module ShiftLeft2PC(instr, PC4, out);
  
  input [25:0] instr;         // Instrution [25-0]
  input [31:0] PC4;           // Output of PC+4 taken as input 
  output reg [31:0] out;      // ShiftLeft2PC Output [31-0]  
  // At the end add two zeros to shift left by 2 bits.
  // Add the upper 4-bits of PC+4
  always @ (instr) begin
    out = {PC4[31:28], {instr[25:0], 2'b00}}; 
  end
endmodule  
