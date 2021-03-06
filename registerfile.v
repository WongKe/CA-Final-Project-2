// EECE3324 
// Computer Architecture
// Final Project
// Kevin Wong & Jonathan Marrero

// A register file consisting of 32 32-bit registers designed in problem 2. 
// The register file has two read ports and one write port, and one write enable port

`timescale 1ns / 1ns

module RegisterFile(readReg1, readReg2, writeReg, writeData, 
                    enable, clk, rst, readData1, readData2);
  
  input [4:0] readReg1, readReg2, writeReg;   // 3 5-bit inputs
  input [31:0] writeData;                     // 1 32-bit input
  input enable, clk, rst;                     // 3 inputs
  output reg[31:0] readData1, readData2;      // 2 32-bit outputs
 
  reg [31:0] registers[31:0];
  
  //  On reset: make registers 0.
  always @ (posedge rst) begin
    registers [0] = 0;
    registers [1] = 0;
    registers [2] = 0;
    registers [3] = 0;
    registers [4] = 0;
    registers [5] = 0;
    registers [6] = 0;
    registers [7] = 0;
    registers [8] = 0;
    registers [9] = 0;
    registers [10] = 0;
    registers [11] = 0;
    registers [12] = 0;
    registers [13] = 0;
    registers [14] = 0;
    registers [15] = 0;
    registers [16] = 0;
    registers [17] = 0;
    registers [18] = 0;
    registers [19] = 0;
    registers [20] = 0;
    registers [21] = 0;
    registers [22] = 0;
    registers [23] = 0;
    registers [24] = 0;
    registers [25] = 0;
    registers [26] = 0;
    registers [27] = 0;
    registers [28] = 0;
    registers [29] = 0;
    registers [30] = 0;
    registers [31] = 0;
  end
  //  Register Data 
  always @ (readReg1 or readReg2) begin
    readData1 <= registers[readReg1];
    readData2 <= registers[readReg2];
  end
  // Write Back
  always @ (posedge clk) begin 
    // Enable? If yes, write data to register.    
    if (enable && (writeReg != 0))
      registers[writeReg] <= writeData;
  end
   
endmodule
