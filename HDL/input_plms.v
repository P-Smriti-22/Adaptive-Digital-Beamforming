`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2021 12:25:19
// Design Name: 
// Module Name: input_plms
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


module input_plms(I1, Q1, I2, Q2, I, Q);
    input signed [17:0] I1, Q1, I2, Q2;
    output signed [17:0] I, Q;
    assign I = I1 + Q2;
    assign Q = Q1 - I2;
    // I1 + jQ1 - j(I2 + jQ2)
endmodule
