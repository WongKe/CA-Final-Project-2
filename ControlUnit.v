// EECE3324 
// Computer Architecture
// Final Project
// Kevin Wong & Jonathan Marrero

// Module for Control Unit
// Input: 6-bit opcode
// Output: 9 control signals
// Control Unit modeled after Pg. 327 Figure 4.22

`timescale 1ns / 1ns

module ControlUnit(opcode, rst, RegDst, Jump, Branch, 
                    MemRead, MemtoReg, MemWrite, ALUsrc, 
                    RegWrite, ALUop, addi, HLT);
  
  input [5:0] opcode;
  input rst;
  output reg RegDst, Jump, Branch, MemRead, MemtoReg, 
              MemWrite, ALUsrc, RegWrite, addi, HLT;
  output reg [1:0] ALUop;
  
  // Initialize Control Unit
  initial begin
    RegDst = 0;
    ALUsrc = 0;
    MemtoReg = 0;
    RegWrite = 0;
    MemRead = 0;
    MemWrite = 0;
    Branch = 0;
    ALUop = 2'b00;
    Jump = 0;
    addi = 0;
    HLT = 0;
  end
        
  // Fetch Outputs
  always @ (opcode) begin
    
	  // Control Signals Produced
	  case (opcode)
	    // R type
	    6'b000000: begin
	      RegDst = 1;
	      ALUsrc = 0;
	      MemtoReg = 0;
	      RegWrite = 1;
	      MemRead = 0;
	      MemWrite = 0;
	      Branch = 0;
	      ALUop = 2'b10;
	      Jump = 0;
	      addi = 0;
	      HLT = 0;
            end
             // ADDI
            6'b001000: begin
              RegDst = 0;
	      ALUsrc = 1;
	      MemtoReg = 0;
	      RegWrite = 1;
	      MemRead = 0;
	      MemWrite = 0;
	      Branch = 0;
	      ALUop = 2'b10;
	      Jump = 0;
	      addi = 1;
	      HLT = 0;
            end
             // LW
            6'b100011: begin
              RegDst = 0;
              ALUsrc = 1;
              MemtoReg = 1;
              RegWrite = 1;
              MemRead = 1;
              MemWrite = 0;
              Branch = 0;
	      ALUop = 2'b00;
	      Jump = 0;
	      addi = 0;
	      HLT = 0;
            end
             // SW
            6'b101011: begin
              ALUsrc = 1;
              RegWrite = 0;
              MemRead = 0;
              MemWrite = 1;
              Branch = 0;
	      ALUop = 2'b00;
	      Jump = 0;
	      addi = 0;
	      HLT = 0;
            end
             // BEQ
            6'b000100: begin
              ALUsrc = 0;
              RegWrite = 0;
              MemRead = 0;
              MemWrite = 0;
              Branch = 1;
	      ALUop = 2'b01;
	      Jump = 0;
	      addi = 0;
	      HLT = 0;
            end
             // JUMP
            6'b000010: begin
              Jump = 1;
            end
             // Halt
            6'b111111: begin
              HLT = 1;
            end     
      default: begin
        RegDst = 0;
        ALUsrc = 0;
        MemtoReg = 0;
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        ALUop = 2'b00;
        Jump = 0;
        addi = 0;
        HLT = 0;
      end
    endcase
  end
  
endmodule
