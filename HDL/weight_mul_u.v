`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2021 18:16:03
// Design Name: 
// Module Name: weight_mul_u
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


module weight_mul_u(clk, uinI, uinQ, wI, wQ, y1I, y1Q);
    input clk;
    input signed [17:0] uinI, uinQ;
    input signed [17:0] wI, wQ;
    output signed [17:0] y1I, y1Q;

    wire [17:0] wcI, wcQ;
    conjugate C1(wI, wQ, wcI, wcQ);
    
    wire [17:0] w_intI, w_intQ, u_intI, u_intQ;
    delay_unit_1 DU1(clk, wcI, wcQ, w_intI, w_intQ);
    delay_unit_1 DU2(clk, uinI, uinQ, u_intI, u_intQ);
    
    complex_mul CM1(w_intI, w_intQ, u_intI, u_intQ, y1I, y1Q);    
endmodule
