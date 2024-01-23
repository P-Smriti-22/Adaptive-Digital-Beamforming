`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2021 13:06:14
// Design Name: 
// Module Name: conjugate
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


module conjugate(Iin, Qin, Iout, Qout);
    input signed [17:0] Iin, Qin;
    output signed [17:0] Iout, Qout;

    assign Iout = Iin;
    assign Qout = Qin * (-1'd1);
endmodule
