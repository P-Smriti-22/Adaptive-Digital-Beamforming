`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2021 18:35:50
// Design Name: 
// Module Name: complex_adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module complex_adder(I1, Q1, I2, Q2, I, Q);
    input signed [17:0] I1,  Q1, I2, Q2;
    output signed [17:0] I, Q;
  
    assign I = I1+I2;
    assign Q = Q1+Q2;
endmodule
