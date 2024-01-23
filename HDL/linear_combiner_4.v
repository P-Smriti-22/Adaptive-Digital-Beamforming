`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2021 19:18:35
// Design Name: 
// Module Name: linear_combiner_4
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


module linear_combiner_4(clk, w1I, w1Q, u1I, u1Q, w2I, w2Q, u2I, u2Q, w3I, w3Q, u3I, u3Q, w4I, w4Q, u4I, u4Q, yD1I, yD1Q);
    input clk;
    input signed [17:0] w1I, w1Q, w2I, w2Q, w3I, w3Q, w4I, w4Q;
    input signed [17:0] u1I, u1Q, u2I, u2Q, u3I, u3Q, u4I, u4Q;
    output signed [17:0] yD1I, yD1Q;
    
    wire [17:0] y1I, y1Q, y2I, y2Q, y3I, y3Q, y4I, y4Q;
    weight_mul_u WMU1(clk, u1I, u1Q, w1I, w1Q, y1I, y1Q);
    weight_mul_u WMU2(clk, u2I, u2Q, w2I, w2Q, y2I, y2Q);
    weight_mul_u WMU3(clk, u3I, u3Q, w3I, w3Q, y3I, y3Q);
    weight_mul_u WMU4(clk, u4I, u4Q, w4I, w4Q, y4I, y4Q); 
       
    wire [17:0] y12I, y12Q, y22I, y22Q, y32I, y32Q, y42I, y42Q; 
    delay_unit_1 DU1(clk, y1I, y1Q, y12I, y12Q);
    delay_unit_1 DU2(clk, y2I, y2Q, y22I, y22Q);
    delay_unit_1 DU3(clk, y3I, y3Q, y32I, y32Q);
    delay_unit_1 DU4(clk, y4I, y4Q, y42I, y42Q); 
         
    wire [17:0] y13I, y13Q, y23I, y23Q, y14I, y14Q;
    complex_adder CA1(y12I, y12Q, y22I, y22Q, y13I, y13Q);
    complex_adder CA2(y32I, y32Q, y42I, y42Q, y23I, y23Q);
    complex_adder CA3(y13I, y13Q, y23I, y23Q, y14I, y14Q);    
    
    delay_unit_1 DU5(clk, y14I, y14Q, yD1I, yD1Q);      
    
endmodule
