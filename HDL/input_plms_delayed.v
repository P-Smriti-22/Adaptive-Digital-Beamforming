`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2021 12:13:32
// Design Name: 
// Module Name: input_plms_delayed
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


module input_plms_delayed(clk, I1, Q1, I, Q);
    input clk;
    input signed [17:0] I1,Q1;    
    output signed [17:0] I,Q;

    wire signed [17:0] I2, Q2;
    delay_unit_1 DU1(clk, I1, Q1, I2, Q2);
    input_plms IP(I1, Q1, I2, Q2, I, Q);
endmodule
