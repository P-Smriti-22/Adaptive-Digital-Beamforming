`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2021 12:14:49
// Design Name: 
// Module Name: delay_unit_D1_1
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


module delay_unit_D1_1(clk, dinI, dinQ, doutI, doutQ);
    input clk;    
    input signed [17:0] dinI, dinQ;
    output reg signed [17:0] doutI = 0;
    output reg signed [17:0] doutQ = 0;
        
    reg signed [17:0] I1 = 0, I2 = 0, Q1 = 0, Q2 = 0;
    always @(posedge clk)
        begin
        I1 <= dinI; I2 <= I1; doutI <=I2;
        Q1 <= dinQ; Q2 <= Q1; doutQ <=Q2;
        end      
endmodule
