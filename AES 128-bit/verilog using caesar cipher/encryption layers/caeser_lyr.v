`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:25:04 07/31/2020 
// Design Name: 
// Module Name:    caeser_lyr 
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
module caeser_lyr(cae_out,key,cae_in);
input [127:0]cae_in; 
input [127:0]key; 
output [127:0]cae_out; 
wire [127:0]w1; 

assign cae_out[127:120]=addr(cae_in[127:120],key[127:120]); 
assign cae_out[119:112]=addr(cae_in[119:112],key[127:120]);
assign cae_out[111:104]=addr(cae_in[111:104],key[127:120]); 
assign cae_out[103:96]=addr(cae_in[103:96],key[127:120]); 
assign cae_out[95:88]=addr(cae_in[95:88],key[127:120]); 
assign cae_out[87:80]=addr(cae_in[87:80],key[127:120]); 
assign cae_out[79:72]=addr(cae_in[79:72],key[127:120]); 
assign cae_out[71:64]=addr(cae_in[71:64],key[127:120]); 
assign cae_out[63:56]=addr(cae_in[63:56],key[127:120]); 
assign cae_out[55:48]=addr(cae_in[55:48],key[127:120]); 
assign cae_out[47:40]=addr(cae_in[47:40],key[127:120]); 
assign cae_out[39:32]=addr(cae_in[39:32],key[127:120]); 
assign cae_out[31:24]=addr(cae_in[31:24],key[127:120]); 
assign cae_out[23:16]=addr(cae_in[23:16],key[127:120]); 
assign cae_out[15:8]=addr(cae_in[15:8],key[127:120]); 
assign cae_out[7:0]=addr(cae_in[7:0],key[127:120]); 



function [7:0]addr;
input [7:0]a; 
input [7:0]b; 
reg cout;
{cout,addr}=a+b; 
endfunction
endmodule	


