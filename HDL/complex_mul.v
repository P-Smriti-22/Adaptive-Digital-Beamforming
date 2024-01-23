`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2021 18:30:27
// Design Name: 
// Module Name: complex_mul
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


module complex_mul(I1, Q1, I2, Q2, I, Q);
    input signed [17:0] I1, Q1, I2, Q2;
    output signed [17:0] I, Q;

    wire [35:0] mulI, mulQ;
    assign mulI = I1*I2-Q1*Q2;
    assign mulQ = I1*Q2 + I2*Q1;
    
    assign I = mulI[32:15];
    assign Q = mulQ[32:15];
endmodule
