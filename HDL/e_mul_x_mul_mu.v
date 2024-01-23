`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2021 11:09:43
// Design Name: 
// Module Name: e_mul_x_mul_mu
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


module e_mul_x_mul_mu(mu, xI, xQ, eI, eQ, updateI, updateQ);
    input [17:0] mu;
    input signed [17:0] xI, xQ, eI, eQ;
    output signed [17:0] updateI, updateQ;
    wire [17:0] xeI, xeQ;
    complex_mul CM1(xI, xQ, eI, eQ, xeI, xeQ);
    complex_mul CM2(xeI, xeQ, mu, 18'd0, updateI, updateQ);        
endmodule
