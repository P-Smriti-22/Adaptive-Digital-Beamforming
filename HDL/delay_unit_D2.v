`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2021 12:10:03
// Design Name: 
// Module Name: delay_unit_D2
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


module delay_unit_D2(clk, dinI, dinQ, doutI, doutQ);
    input clk;    
    input signed [17:0] dinI, dinQ;
    output reg signed [17:0] doutI = 0;
    output reg signed [17:0] doutQ = 0;  
    // D2 = 2 
    reg signed [17:0] I1 = 0,Q1 = 0;
    always @(posedge clk)
        begin
        I1 <= dinI; doutI <=I1;
        Q1 <= dinQ; doutQ <=Q1;
        end 
endmodule
