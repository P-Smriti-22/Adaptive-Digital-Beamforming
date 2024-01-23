`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2021 11:55:20
// Design Name: 
// Module Name: eRCpLMS
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


module eRCpLMS(clk, SD1I, SD1Q, YD1I, YD1Q, econjI, econjQ);
    input clk;
    input signed [17:0] SD1I, SD1Q, YD1I, YD1Q;
    output signed [17:0] econjI, econjQ;

    wire [17:0] eI, eQ, e1I, e1Q;
    assign eI = SD1I - YD1I;
    assign eQ = SD1Q - YD1Q;
    
    delay_unit_1 DU1(clk, eI, eQ, e1I, e1Q);
    conjugate C1(e1I, e1Q, econjI, econjQ);  
    
endmodule
