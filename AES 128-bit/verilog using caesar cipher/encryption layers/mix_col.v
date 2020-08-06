`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:52:15 04/17/2020 
// Design Name: 
// Module Name:    mix_col 
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
module mix_col(i_shift,i_mix);
input [127:0]i_shift;
output [127:0]i_mix;

assign i_mix[127:120] = xtime(i_shift[127:120])^xtime(i_shift[119:112])^i_shift[119:112]^i_shift[111:104]^i_shift[103:96];
assign i_mix[95:88] = xtime(i_shift[95:88])^xtime(i_shift[87:80])^i_shift[87:80]^i_shift[79:72]^i_shift[71:64];
assign i_mix[63:56] = xtime(i_shift[63:56])^xtime(i_shift[55:48])^i_shift[55:48]^i_shift[47:40]^i_shift[39:32];
assign i_mix[31:24] = xtime(i_shift[31:24])^xtime(i_shift[23:16])^i_shift[23:16]^i_shift[15:8]^i_shift[7:0];

assign i_mix[119:112] = i_shift[127:120]^xtime(i_shift[119:112])^xtime(i_shift[111:104])^i_shift[111:104]^i_shift[103:96];
assign i_mix[87:80] = i_shift[95:88]^xtime(i_shift[87:80])^xtime(i_shift[79:72])^i_shift[79:72]^i_shift[71:64];
assign i_mix[55:48] = i_shift[63:56]^xtime(i_shift[55:48])^xtime(i_shift[47:40])^i_shift[47:40]^i_shift[39:32];
assign i_mix[23:16] = i_shift[31:24]^xtime(i_shift[23:16])^xtime(i_shift[15:8])^i_shift[15:8]^i_shift[7:0];

assign i_mix[111:104] = i_shift[127:120]^i_shift[119:112]^xtime(i_shift[111:104])^xtime(i_shift[103:96])^i_shift[103:96];
assign i_mix[79:72] = i_shift[95:88]^i_shift[87:80]^xtime(i_shift[79:72])^xtime(i_shift[71:64])^i_shift[71:64];
assign i_mix[47:40] = i_shift[63:56]^i_shift[55:48]^xtime(i_shift[47:40])^xtime(i_shift[39:32])^i_shift[39:32];
assign i_mix[15:8] = i_shift[31:24]^i_shift[23:16]^xtime(i_shift[15:8])^xtime(i_shift[7:0])^i_shift[7:0];

assign i_mix[103:96] = xtime(i_shift[127:120])^i_shift[127:120]^i_shift[119:112]^i_shift[111:104]^xtime(i_shift[103:96]);
assign i_mix[71:64] = xtime(i_shift[95:88])^i_shift[95:88]^i_shift[87:80]^i_shift[79:72]^xtime(i_shift[71:64]);
assign i_mix[39:32] = xtime(i_shift[63:56])^i_shift[63:56]^i_shift[55:48]^i_shift[47:40]^xtime(i_shift[39:32]);
assign i_mix[7:0] = xtime(i_shift[31:24])^i_shift[31:24]^i_shift[23:16]^i_shift[15:8]^xtime(i_shift[7:0]);


function [7:0]xtime;
input [7:0]i;
begin
if(i[7]==0)
xtime = {i[6:0],1'b0};
else
xtime = {i[6:0],1'b0}^8'h1b;
end
endfunction
endmodule
