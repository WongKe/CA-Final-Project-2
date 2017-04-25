//  EECE3324 
//  Computer Architecture
//  Final Project
//  Kevin Wong & Jonathan Marrero

//  This module serves as the 2-1 Multiplexer (32 bit)

`timescale 1ns / 1ns

module mux2to1(in0, in1, sel, out);
  
  input [31:0] in0, in1;    //  Input 1 & 2
  input sel;                //  Bit for Select
  output reg [31:0] out;    //  Output
  
  
  //  Loop for MUX operation
  
  always @ (sel or in0 or in1)
  begin
    case(sel)
      //  Select = 0
      1'b0: begin
        // Input 1 is chosen
        out <= in0;
      end
      //  Select = 1
      1'b1: begin
        //  Input 2 is chosen
        out <= in1;
      end
    endcase
  end
  
endmodule
