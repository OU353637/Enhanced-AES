`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:54:29 04/17/2020 
// Design Name: 
// Module Name:    add_round_key_layr 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module add_round_key_layr(data_in,key_in,data_out);
input [127:0]data_in;
input [127:0]key_in;
output [127:0]data_out;
assign data_out=key_in^data_in;

endmodule

