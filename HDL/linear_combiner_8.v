`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2021 19:53:08
// Design Name: 
// Module Name: linear_combiner_8
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


module linear_combiner_8(clk, w14, w58, x14, x58, yD1);
    input clk;    
    input signed [143:0] x14, x58, w14, w58;
    output signed [35:0] yD1;

    wire signed [17:0] x1I, x1Q, x2I, x2Q, x3I, x3Q, x4I, x4Q, x5I, x5Q, x6I, x6Q, x7I, x7Q, x8I, x8Q;
    wire signed [17:0] w1I, w1Q, w2I, w2Q, w3I, w3Q, w4I, w4Q, w5I, w5Q, w6I, w6Q, w7I, w7Q, w8I, w8Q;
    assign {x1I, x1Q, x2I, x2Q, x3I, x3Q, x4I, x4Q, x5I, x5Q, x6I, x6Q, x7I, x7Q, x8I, x8Q} = {x14, x58};    
    assign {w1I, w1Q, w2I, w2Q, w3I, w3Q, w4I, w4Q, w5I, w5Q, w6I, w6Q, w7I, w7Q, w8I, w8Q} = {w14, w58};
    
    wire signed [17:0] y1D1I, y1D1Q, y2D1I, y2D1Q, yD1I, yD1Q;
    wire signed [17:0] u1I, u1Q, u2I, u2Q, u3I, u3Q, u4I, u4Q, u5I, u5Q, u6I, u6Q, u7I, u7Q, u8I, u8Q;
        
    input_plms_delayed IPD1(clk, x1I, x1Q, u1I, u1Q);
    input_plms_delayed IPD2(clk, x2I, x2Q, u2I, u2Q);
    input_plms_delayed IPD3(clk, x3I, x3Q, u3I, u3Q);
    input_plms_delayed IPD4(clk, x4I, x4Q, u4I, u4Q);
    input_plms_delayed IPD5(clk, x5I, x5Q, u5I, u5Q);
    input_plms_delayed IPD6(clk, x6I, x6Q, u6I, u6Q);
    input_plms_delayed IPD7(clk, x7I, x7Q, u7I, u7Q);
    input_plms_delayed IPD8(clk, x8I, x8Q, u8I, u8Q);     
    
    linear_combiner_4 LC4_1(clk, w1I, w1Q, u1I, u1Q, w2I, w2Q, u2I, u2Q, w3I, w3Q, u3I, u3Q,  w4I, w4Q, u4I, u4Q, y1D1I, y1D1Q);
    linear_combiner_4 LC4_2(clk, w5I, w5Q, u5I, u5Q, w6I, w6Q, u6I, u6Q, w7I, w7Q, u7I, u7Q,  w8I, w8Q, u8I, u8Q, y2D1I, y2D1Q);
    
    complex_adder CA(y1D1I, y1D1Q, y2D1I, y2D1Q, yD1I, yD1Q);     
    assign yD1 = {yD1I, yD1Q};      
endmodule
