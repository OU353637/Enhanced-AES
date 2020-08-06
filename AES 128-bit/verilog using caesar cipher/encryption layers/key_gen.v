`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:53:24 04/17/2020 
// Design Name: 
// Module Name:    key_gen 
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
module key_gen(key_in,rcon,key_out);

input [127:0]key_in;
input [31:0]rcon;
output [127:0]key_out;
wire [127:0]key_out;

//shifting operation
wire [127:0]key;
wire [31:0]key2;

assign key[127:32]=key_in[127:32];
assign key[31:24]=key_in[23:16];
assign key[23:16]=key_in[15:8];
assign key[15:8]=key_in[7:0];
assign key[7:0]=key_in[31:24];

//sub_bytes operation

sbox s1(key[31:28],key[27:24],key2[31:24]);
sbox s2(key[23:20],key[19:16],key2[23:16]);
sbox s3(key[15:12],key[11:8],key2[15:8]);
sbox s4(key[7:4],key[3:0],key2[7:0]);

//multiplication with rcon values
//xor with different column
//ko is also numbered column wise

assign key_out[127:96]=key2[31:0]^key_in[127:96]^rcon[31:0];
assign key_out[95:64]=key_out[127:96]^key_in[95:64]; 
assign key_out[63:32]=key_out[95:64]^key_in[63:32];
assign key_out[31:0]=key_out[63:32]^key_in[31:0];

endmodule

