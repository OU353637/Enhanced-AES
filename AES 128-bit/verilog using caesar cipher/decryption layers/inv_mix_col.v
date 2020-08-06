`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:23:10 04/18/2020 
// Design Name: 
// Module Name:    inv_mix_col 
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
module inv_mix_col(i_shift,i_mix);
input [127:0]i_shift;
output [127:0]i_mix;

assign i_mix[127:120] = x8time(i_shift[127:120])^x4time(i_shift[127:120])^xtime(i_shift[127:120])^x8time(i_shift[119:112])^xtime(i_shift[119:112])^i_shift[119:112]^x8time(i_shift[111:104])^x4time(i_shift[111:104])^i_shift[111:104]^x8time(i_shift[103:96])^i_shift[103:96];
//assign i_mix[127:120] = x14time(i_shift[127:120])^x11time(i_shift[119:112])^x13time(i_shift[111:104])^x9time(i_shift[103:96]);

assign i_mix[95:88] = x8time(i_shift[95:88])^x4time(i_shift[95:88])^xtime(i_shift[95:88])^x8time(i_shift[87:80])^xtime(i_shift[87:80])^i_shift[87:80]^x8time(i_shift[79:72])^x4time(i_shift[79:72])^i_shift[79:72]^x8time(i_shift[71:64])^i_shift[71:64];
assign i_mix[63:56] = x8time(i_shift[63:56])^x4time(i_shift[63:56])^xtime(i_shift[63:56])^x8time(i_shift[55:48])^xtime(i_shift[55:48])^i_shift[55:48]^x8time(i_shift[47:40])^x4time(i_shift[47:40])^i_shift[47:40]^x8time(i_shift[39:32])^i_shift[39:32];
assign i_mix[31:24] = x8time(i_shift[31:24])^x4time(i_shift[31:24])^xtime(i_shift[31:24])^x8time(i_shift[23:16])^xtime(i_shift[23:16])^i_shift[23:16]^x8time(i_shift[15:8])^x4time(i_shift[15:8])^i_shift[15:8]^x8time(i_shift[7:0])^i_shift[7:0];

assign i_mix[119:112] = x8time(i_shift[127:120])^i_shift[127:120]^x8time(i_shift[119:112])^x4time(i_shift[119:112])^xtime(i_shift[119:112])^x8time(i_shift[111:104])^xtime(i_shift[111:104])^i_shift[111:104]^x8time(i_shift[103:96])^x4time(i_shift[103:96])^i_shift[103:96];
assign i_mix[87:80] = x9time(i_shift[95:88])^x14time(i_shift[87:80])^x11time(i_shift[79:72])^x13time(i_shift[71:64]);
assign i_mix[55:48] = x9time(i_shift[63:56])^x14time(i_shift[55:48])^x11time(i_shift[47:40])^x13time(i_shift[39:32]);
assign i_mix[23:16] = x9time(i_shift[31:24])^x14time(i_shift[23:16])^x11time(i_shift[15:8])^x13time(i_shift[7:0]);

assign i_mix[111:104] = x13time(i_shift[127:120])^x9time(i_shift[119:112])^x14time(i_shift[111:104])^x11time(i_shift[103:96]);
assign i_mix[79:72] = x13time(i_shift[95:88])^x9time(i_shift[87:80])^x14time(i_shift[79:72])^x11time(i_shift[71:64]);
assign i_mix[47:40] = x13time(i_shift[63:56])^x9time(i_shift[55:48])^x14time(i_shift[47:40])^x11time(i_shift[39:32]);
assign i_mix[15:8] =x13time(i_shift[31:24])^x9time(i_shift[23:16])^x14time(i_shift[15:8])^x11time(i_shift[7:0]);

assign i_mix[103:96] = x11time(i_shift[127:120])^x13time(i_shift[119:112])^x9time(i_shift[111:104])^x14time(i_shift[103:96]);
assign i_mix[71:64] = x11time(i_shift[95:88])^x13time(i_shift[87:80])^x9time(i_shift[79:72])^x14time(i_shift[71:64]);
assign i_mix[39:32] = x11time(i_shift[63:56])^x13time(i_shift[55:48])^x9time(i_shift[47:40])^x14time(i_shift[39:32]);
assign i_mix[7:0] = x11time(i_shift[31:24])^x13time(i_shift[23:16])^x9time(i_shift[15:8])^x14time(i_shift[7:0]);


function [7:0]xtime;
input [7:0]i;
begin
if(i[7]==0)
xtime = {i[6:0],1'b0};
else
xtime = {i[6:0],1'b0}^8'h1b;
end
endfunction


function [7:0]x4time;
input [7:0]i;
reg var1;
reg [7:0] var2;
begin
var1=i[6];
if(i[7]==0)
var2 = {i[5:0],2'b00};
else
var2 = {i[5:0],2'b00}^8'h36;
if(var1==1)
x4time=var2^8'h1b;
else
x4time=var2;
end
endfunction



function [7:0]x8time;
input [7:0]i;
reg var1,var2;
reg [7:0] var3;
begin
var1=i[6];
var2=i[5];

if(i[7]==0)
var3 = {i[4:0],3'b000};
else
var3 = {i[4:0],3'b000}^8'h6c;

if(var1==1)
var3=var3^8'h36;
else
var3=var3;

if(var2==1)
x8time=var3^8'h1b;
else
x8time=var3;

end
endfunction

function [7:0]x9time;
input [7:0]j;
reg [7:0] var;
begin
var=x8time(j);
var=var^j[7:0];
x9time=var;
end
endfunction

function [7:0]x11time;
input [7:0]j;
reg [7:0] var1,var2,var3;
begin
var1=x8time(j);
var2=xtime(j);
var3=var1^var2^j[7:0];
x11time=var3;
end
endfunction

function [7:0]x13time;
input [7:0]j;
reg [7:0] var1,var2,var3;
begin
var1=x8time(j);
var2=x4time(j);
var3=var1^var2^j[7:0];
x13time=var3;
end
endfunction

function [7:0]x14time;
input [7:0]j;
reg [7:0] var1,var2,var3,var4;
begin
var1=x8time(j);
var2=x4time(j);
var3=xtime(j);
var4=var1^var2^var3;
x14time=var4;
end
endfunction







endmodule
