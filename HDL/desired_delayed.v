`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2021 10:57:38
// Design Name: 
// Module Name: desired_delayed
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


module desired_delayed(clk, dinI, dinQ, SD1I, SD1Q);
    input clk;
    input signed [17:0] dinI, dinQ;   
    output signed [17:0] SD1I, SD1Q;  
     
    wire signed [17:0] dI, dQ, SI, SQ;
    input_plms_delayed IID1(clk, dinI, dinQ, SI, SQ);
    
    delay_unit_D1_1 DU3(clk, SI, SQ, SD1I, SD1Q);          
endmodule
