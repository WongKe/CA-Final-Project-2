//  EECE3324 
//  Computer Architecture
//  Final Project
//  Kevin Wong & Jonathan Marrero

// This module serves as the ALU Control Unit.
// Inputs: ALUop and 6-bit function code.
// Output: 4-bit ALU_operation signal that goes to the ALU.

// Fuction code from Pg. 318 Figure 4.13 


`timescale 1ns / 1ns

module ALU_ControlUnit(ALUop, addi, func, ALUctrlop);
  
  input [1:0] ALUop;
  input addi;
  input [5:0] func;
  output reg [3:0] ALUctrlop;
  
  // Initialize Control Unit
  initial begin
    ALUctrlop = 4'b0000;
  end
  
  
  always @ (ALUop or func) begin
    case (ALUop)
      
      // LW and SW (Add Operation)
      2'b00: begin ALUctrlop = 4'b0010; 
      end
      
      // BEQ (Subtract Operation)
      2'b01: begin ALUctrlop = 4'b0110; 
      end
      
      // When ALUOp1 == 1
      2'b10: begin
        // Addi is allowed
        case (addi)
          1'b1: begin ALUctrlop = 4'b0010; 
          end
          
          1'b0: begin
            case (func[3:0]) 
              // ADD
              4'b0000: begin ALUctrlop = 4'b0010; 
              end
              // SUB
              4'b0010: begin ALUctrlop = 4'b0110; 
              end
              // AND
              4'b0100: begin ALUctrlop = 4'b0000; 
              end
              // OR
              4'b0101: begin ALUctrlop = 4'b0001; 
              end
              // SLT
              4'b1010: begin ALUctrlop = 4'b0111; 
              end
            endcase
          end
        endcase
      end
      
      // NOT CARE CASES
      2'b11: begin
        case (func[3:0]) // func[5:4] don't care
          // SUB
          4'b0010: begin ALUctrlop = 4'b0110; 
          end
          // SLT
          4'b1010: begin ALUctrlop = 4'b0111; 
          end
        endcase
      end
    endcase
  end
  
endmodule
            
      
