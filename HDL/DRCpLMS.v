`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2021 11:38:11
// Design Name: 
// Module Name: DRCpLMS
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


module DRCpLMS(clk, din, xin1, xin2, xin3, xin4, xin5, xin6, xin7, xin8, wo1, wo2, wo3, wo4, wo5, wo6, wo7, wo8);
    input clk;
    input signed [35:0] din, xin1, xin2, xin3, xin4, xin5,  xin6, xin7, xin8;  
    output signed [35:0] wo1, wo2, wo3, wo4, wo5, wo6, wo7, wo8; 
    wire signed [35:0] x1, x2, x3, x4, x5, x6, x7, x8;
    wire signed [35:0] d;
    wire signed [35:0] w1, w2, w3, w4, w5, w6, w7, w8;
    
    input_register IR(clk, din, {xin1, xin2, xin3, xin4},{xin5, xin6, xin7, xin8}, {wo1, wo2, wo3, wo4}, {wo5, wo6, wo7, wo8}, d, {x1, x2, x3, x4}, {x5, x6, x7, x8}, {w1, w2, w3, w4}, {w5, w6, w7, w8});
    
    wire signed [17:0] dI, dQ;
    
    assign {dI, dQ} = d;
    
    wire signed [17:0] SD1I, SD1Q, YD1I, YD1Q, econjI, econjQ;
    
    desired_delayed DD(clk, dI, dQ, SD1I, SD1Q);          
    
    linear_combiner_8 LC8(clk, {w1, w2, w3, w4}, {w5, w6, w7, w8}, {x1, x2, x3, x4}, {x5, x6, x7, x8}, {YD1I, YD1Q});
    
    eRCpLMS e(clk, SD1I, SD1Q, YD1I, YD1Q, econjI, econjQ);
    
    weight_update_8 WU8(clk, econjI, econjQ, {x1, x2, x3, x4}, {x5, x6, x7, x8}, {w1, w2, w3, w4}, {w5, w6, w7, w8}, {wo1, wo2, wo3, wo4}, {wo5, wo6, wo7, wo8});
   
endmodule

