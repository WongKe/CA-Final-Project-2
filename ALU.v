//  EECE3324 
//  Computer Architecture
//  Final Project
//  Kevin Wong & Jonathan Marrero

//  This module serves as the ALU. Supports the following MIPS instructions:
//  add, addi, beq, j, lw and sw. Inputs: 4-bit control signal, two 32-bit data inputs.
//  Outputs: 32-bit ALUresult and 1 bit Zero. 

`timescale 1ns / 1ns

module ALU(ALUctrlop, in0, in1, ALUresult, Zero);
  
 input [3:0] ALUctrlop;
 input [31:0] in0, in1;
  output reg [31:0] ALUresult;
  output Zero;
  
  // Zero initialized
  assign Zero = (ALUresult == '0);
  
  // ALU result produced
 always @ (in0 or in1 or ALUctrlop) begin
    
  case (ALUctrlop)
      // AND
      4'b0000: begin ALUresult = in0 & in1; end
      // OR
      4'b0001: begin ALUresult = in0 | in1; end
      // ADD
      4'b0010: begin ALUresult = in0 + in1; end
      // SUB
      4'b0110: begin ALUresult = in0 - in1; end
      // SLT
      4'b0111: begin ALUresult = in0 < in1 ? 1 : 0; end
      // NOR
     4'b1000: begin ALUresult = ~(in0 | in1); end
      default: begin ALUresult = 0; 
      end
    endcase
  end
  
endmodule
