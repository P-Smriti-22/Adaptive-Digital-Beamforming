`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2021 11:02:07
// Design Name: 
// Module Name: delay_unit
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


module delay_unit_1(clk, dinI, dinQ, doutI, doutQ);
    input clk;    
    input signed [17:0] dinI, dinQ;
    output reg signed [17:0] doutI = 0;
    output reg signed [17:0] doutQ = 0;
         
    always @(posedge clk)
        begin
        doutI <=dinI;
        doutQ <=dinQ;
        end      
endmodule
