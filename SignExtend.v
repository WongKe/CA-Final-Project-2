// EECE3324 
// Computer Architecture
// Final Project
// Kevin Wong & Jonathan Marrero

// Module for Sign Extend
// Input: Instruction [15-0]
// Output: Sign Extend output

module SignExtend(instr, SEout);
  
  input [15:0] instr;       // INSTRUCTIONS
  output reg [31:0] SEout;  // Output of Sign Extend module [31-0]
  // Sign Extend Operation
  always @ (instr) begin
    SEout <= $signed(instr);
  end
  
endmodule
