`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2021 10:41:24
// Design Name: 
// Module Name: weight_update_4
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


module weight_update_4(clk, x1I, x1Q, w1I, w1Q, e1I, e1Q, x2I, x2Q, w2I, w2Q, e2I, e2Q, x3I, x3Q, w3I, w3Q, e3I, e3Q, x4I, x4Q, w4I, w4Q, e4I, e4Q, w1_outI, w1_outQ, w2_outI, w2_outQ, w3_outI, w3_outQ, w4_outI, w4_outQ);
    input clk;
    input signed [17:0]  x1I, x1Q, w1I, w1Q, e1I, e1Q, x2I, x2Q, w2I, w2Q, e2I, e2Q, x3I, x3Q, w3I, w3Q, e3I, e3Q, x4I, x4Q, w4I, w4Q, e4I, e4Q;   
    output signed [17:0] w1_outI, w1_outQ, w2_outI, w2_outQ, w3_outI, w3_outQ, w4_outI, w4_outQ;
    parameter mu = 18'd512;
    //wire [17:0] mu1, mu2, mu3, mu4;
    //wire [17:0] del_e1, del_e2, del_e3, del_e4;
    //wire [17:0] del_eout1, del_eout2, del_eout3, del_eout4 ;
    wire [17:0] w12I, w12Q, w22I, w22Q, w32I, w32Q, w42I, w42Q;
    wire [17:0] e12I, e12Q, e22I, e22Q, e32I, e32Q, e42I, e42Q;
    wire [17:0] x12I, x12Q, x22I, x22Q, x32I, x32Q, x42I, x42Q;  
         
    delay_unit_1 DU1(clk, w1I, w1Q, w12I, w12Q);     
    delay_unit_1 DU2(clk, w2I, w2Q, w22I, w22Q);
    delay_unit_1 DU3(clk, w3I, w3Q, w32I, w32Q);
    delay_unit_1 DU4(clk, w4I, w4Q, w42I, w42Q);
    delay_unit_1 DU5(clk, e1I, e1Q, e12I, e12Q);
    delay_unit_1 DU6(clk, e2I, e2Q, e22I, e22Q);
    delay_unit_1 DU7(clk, e3I, e3Q, e32I, e32Q);
    delay_unit_1 DU8(clk, e4I, e4Q, e42I, e42Q);
    delay_unit_1 DU9(clk, x1I, x1Q, x12I, x12Q);
    delay_unit_1 DU10(clk, x2I, x2Q, x22I, x22Q);
    delay_unit_1 DU11(clk, x3I, x3Q, x32I, x32Q);
    delay_unit_1 DU12(clk, x4I, x4Q, x42I, x42Q);    
    
    //vss vss1(e12I, e12Q, x12I, x12Q, del_e1, del_eout1, mu1);
    //vss vss2(e22I, e22Q, x22I, x22Q, del_e2, del_eout2, mu2);
    //vss vss3(e32I, e32Q, x32I, x32Q, del_e3, del_eout3, mu3);
    //vss vss4(e42I, e42Q, x42I, x42Q, del_e4, del_eout4, mu4);
    //assign {del_e1, del_e2, del_e3, del_e4} = {del_eout1, del_eout2, del_eout3, del_eout4 };
    
    wire [17:0] xe1I, xe1Q, xe2I, xe2Q, xe3I, xe3Q, xe4I, xe4Q;
    e_mul_x_mul_mu EMXMM1(mu, x12I, x12Q, e12I, e12Q,  xe1I, xe1Q);
    e_mul_x_mul_mu EMXMM2(mu, x22I, x22Q, e22I, e22Q,  xe2I, xe2Q);
    e_mul_x_mul_mu EMXMM3(mu, x32I, x32Q, e22I, e32Q,  xe3I, xe3Q);
    e_mul_x_mul_mu EMXMM4(mu, x42I, x42Q, e22I, e42Q,  xe4I, xe4Q);
       
    wire [17:0] w13I, w13Q, w23I, w23Q, w33I, w33Q, w43I, w43Q; 
    wire [17:0] xe11I, xe11Q, xe21I, xe21Q, xe31I, xe31Q, xe41I, xe41Q;  
    delay_unit_1 DU13(clk, w12I, w12Q, w13I, w13Q);     
    delay_unit_1 DU14(clk, w22I, w22Q, w23I, w23Q);
    delay_unit_1 DU15(clk, w32I, w32Q, w33I, w33Q);
    delay_unit_1 DU16(clk, w42I, w42Q, w43I, w43Q);
    delay_unit_1 DU17(clk, xe1I, xe1Q, xe11I, xe11Q);
    delay_unit_1 DU18(clk, xe2I, xe2Q, xe21I, xe21Q);
    delay_unit_1 DU19(clk, xe3I, xe3Q, xe31I, xe31Q);
    delay_unit_1 DU20(clk, xe4I, xe4Q, xe41I, xe41Q);
    
    complex_adder CA1(w13I, w13Q, xe11I, xe11Q, w1_outI, w1_outQ);
    complex_adder CA2(w23I, w23Q, xe21I, xe21Q, w2_outI, w2_outQ);
    complex_adder CA3(w33I, w33Q, xe31I, xe31Q, w3_outI, w3_outQ);
    complex_adder CA4(w43I, w43Q, xe41I, xe41Q, w4_outI, w4_outQ);
  
endmodule
