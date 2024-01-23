`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2021 11:24:20
// Design Name: 
// Module Name: weight_update_8
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


module weight_update_8(clk, ecI, ecQ, x14, x58, w14, w58, wo14, wo58);
    input clk;
    input signed [17:0] ecI, ecQ;
    input signed [143:0]  x14, x58, w14, w58;
    output signed [143:0] wo14, wo58;
    
    wire signed [17:0] xi1I, xi1Q, xi2I, xi2Q, xi3I, xi3Q, xi4I, xi4Q, xi5I, xi5Q, xi6I, xi6Q, xi7I, xi7Q, xi8I, xi8Q;
    wire signed [17:0] w1I, w1Q, w2I, w2Q, w3I, w3Q, w4I, w4Q, w5I, w5Q, w6I, w6Q, w7I, w7Q, w8I, w8Q;
    assign {xi1I, xi1Q, xi2I, xi2Q, xi3I, xi3Q, xi4I, xi4Q, xi5I, xi5Q, xi6I, xi6Q, xi7I, xi7Q, xi8I, xi8Q} = {x14, x58};    
    assign {w1I, w1Q, w2I, w2Q, w3I, w3Q, w4I, w4Q, w5I, w5Q, w6I, w6Q, w7I, w7Q, w8I, w8Q} = {w14, w58};
    
    wire signed [17:0] x1I, x1Q, x2I, x2Q, x3I, x3Q, x4I, x4Q, x5I, x5Q, x6I, x6Q, x7I, x7Q, x8I, x8Q;
    delay_unit_D1 DU31(clk, xi1I, xi1Q, x1I, x1Q);
    delay_unit_D1 DU32(clk, xi2I, xi2Q, x2I, x2Q);
    delay_unit_D1 DU33(clk, xi3I, xi3Q, x3I, x3Q);
    delay_unit_D1 DU34(clk, xi4I, xi4Q, x4I, x4Q);
    delay_unit_D1 DU35(clk, xi5I, xi5Q, x5I, x5Q);
    delay_unit_D1 DU36(clk, xi6I, xi6Q, x6I, x6Q);
    delay_unit_D1 DU37(clk, xi7I, xi7Q, x7I, x7Q);
    delay_unit_D1 DU38(clk, xi8I, xi8Q, x8I, x8Q);
    
    wire signed [17:0] e1I, e1Q, e2I, e2Q, e3I, e3Q, e4I, e4Q, e5I, e5Q, e6I, e6Q, e7I, e7Q, e8I, e8Q;
    wire signed [17:0] wo1I, wo1Q, wo2I, wo2Q, wo3I, wo3Q, wo4I, wo4Q, wo5I, wo5Q, wo6I, wo6Q, wo7I, wo7Q, wo8I, wo8Q; 
    assign {e1I, e1Q, e2I, e2Q, e3I, e3Q, e4I, e4Q, e5I, e5Q, e6I, e6Q, e7I, e7Q, e8I, e8Q} = {ecI, ecQ, ecI, ecQ, ecI, ecQ, ecI, ecQ, ecI, ecQ, ecI, ecQ, ecI, ecQ, ecI, ecQ}; 
          
    weight_update_4 WU41( clk, x1I, x1Q, w1I, w1Q, e1I, e1Q, x2I, x2Q, w2I, w2Q, e2I, e2Q, x3I, x3Q, w3I, w3Q, e3I, e3Q, x4I, x4Q, w4I, w4Q, e4I, e4Q, wo1I, wo1Q, wo2I, wo2Q, wo3I, wo3Q, wo4I, wo4Q);
    weight_update_4 WU42( clk, x5I, x5Q, w5I, w5Q, e5I, e5Q, x6I, x6Q, w6I, w6Q, e6I, e6Q, x7I, x7Q, w7I, w7Q, e7I, e7Q, x8I, x8Q, w8I, w8Q, e8I, e8Q, wo5I, wo5Q, wo6I, wo6Q, wo7I, wo7Q, wo8I, wo8Q);
    
    assign {wo14, wo58} = {wo1I, wo1Q, wo2I, wo2Q, wo3I, wo3Q, wo4I, wo4Q, wo5I, wo5Q, wo6I, wo6Q, wo7I, wo7Q, wo8I, wo8Q};
endmodule
