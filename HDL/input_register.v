`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2021 17:00:27
// Design Name: 
// Module Name: input_register
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


module input_register(clk, din, xin14, xin58, win14, win58, d, x14, x58, w14, w58);
    input clk;
    input signed [35:0] din;
    input signed [143:0] xin14, xin58, win14, win58;
    output signed [143:0] x14, x58, w14, w58;
    output signed [35:0] d;
    
    wire signed [17:0] dI, dQ;
    wire signed [17:0] x1I, x1Q, x2I, x2Q, x3I, x3Q, x4I, x4Q, x5I, x5Q, x6I, x6Q, x7I, x7Q, x8I, x8Q;
    wire signed [17:0] w1I, w1Q, w2I, w2Q, w3I, w3Q, w4I, w4Q, w5I, w5Q, w6I, w6Q, w7I, w7Q, w8I, w8Q;
    
    assign {x1I, x1Q, x2I, x2Q, x3I, x3Q, x4I, x4Q, x5I, x5Q, x6I, x6Q, x7I, x7Q, x8I, x8Q} = {xin14, xin58};
    assign {dI, dQ} = din;
    assign {w1I, w1Q, w2I, w2Q, w3I, w3Q, w4I, w4Q, w5I, w5Q, w6I, w6Q, w7I, w7Q, w8I, w8Q} = {win14, win58};
    
    wire signed [17:0] doI, doQ;
    wire signed [17:0] xo1I, xo1Q, xo2I, xo2Q, xo3I, xo3Q, xo4I, xo4Q, xo5I, xo5Q, xo6I, xo6Q, xo7I, xo7Q, xo8I, xo8Q;
    wire signed [17:0] wo1I, wo1Q, wo2I, wo2Q, wo3I, wo3Q, wo4I, wo4Q, wo5I, wo5Q, wo6I, wo6Q, wo7I, wo7Q, wo8I, wo8Q;
    
    delay_unit_1 DU1(clk, x1I, x1Q, xo1I, xo1Q); 
    delay_unit_1 DU2(clk, x2I, x2Q, xo2I, xo2Q);
    delay_unit_1 DU3(clk, x3I, x3Q, xo3I, xo3Q);
    delay_unit_1 DU4(clk, x4I, x4Q, xo4I, xo4Q);
    delay_unit_1 DU5(clk, x5I, x5Q, xo5I, xo5Q);
    delay_unit_1 DU6(clk, x6I, x6Q, xo6I, xo6Q);
    delay_unit_1 DU7(clk, x7I, x7Q, xo7I, xo7Q);
    delay_unit_1 DU8(clk, x8I, x8Q, xo8I, xo8Q);
    
    delay_unit_1 DU9(clk, w1I, w1Q, wo1I, wo1Q); 
    delay_unit_1 DU10(clk, w2I, w2Q, wo2I, wo2Q);
    delay_unit_1 DU11(clk, w3I, w3Q, wo3I, wo3Q);
    delay_unit_1 DU12(clk, w4I, w4Q, wo4I, wo4Q);
    delay_unit_1 DU13(clk, w5I, w5Q, wo5I, wo5Q);
    delay_unit_1 DU14(clk, w6I, w6Q, wo6I, wo6Q);
    delay_unit_1 DU15(clk, w7I, w7Q, wo7I, wo7Q);
    delay_unit_1 DU16(clk, w8I, w8Q, wo8I, wo8Q); 
    
    delay_unit_1 DU17(clk, dI, dQ, doI, doQ); 
    
    assign d = {doI, doQ};
    assign x14 = {xo1I, xo1Q, xo2I, xo2Q, xo3I, xo3Q, xo4I, xo4Q};
    assign x58 = {xo5I, xo5Q, xo6I, xo6Q, xo7I, xo7Q, xo8I, xo8Q};
    assign w14 = {wo1I, wo1Q, wo2I, wo2Q, wo3I, wo3Q, wo4I, wo4Q};
    assign w58 = {wo5I, wo5Q, wo6I, wo6Q, wo7I, wo7Q, wo8I, wo8Q};
    
endmodule
