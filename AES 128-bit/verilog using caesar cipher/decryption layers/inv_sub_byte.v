`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:26:58 04/18/2020 
// Design Name: 
// Module Name:    inv_sub_byte 
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
module inv_sub_byte(in_key,out_key);
input [127:0] in_key;
output [127:0] out_key;


inv_sbox sb1(in_key[7:4],in_key[3:0],out_key[7:0]);
inv_sbox sb2(in_key[47:44],in_key[43:40],out_key[47:40]);
inv_sbox sb3(in_key[87:84],in_key[83:80],out_key[87:80]);
inv_sbox sb4(in_key[127:124],in_key[123:120],out_key[127:120]);

inv_sbox sb5(in_key[39:36],in_key[35:32],out_key[39:32]);
inv_sbox sb6(in_key[79:76],in_key[75:72],out_key[79:72]);
inv_sbox sb7(in_key[119:116],in_key[115:112],out_key[119:112]);
inv_sbox sb8(in_key[31:28],in_key[27:24],out_key[31:24]);

inv_sbox sb9(in_key[71:68],in_key[67:64],out_key[71:64]);
inv_sbox sb10(in_key[111:108],in_key[107:104],out_key[111:104]);
inv_sbox sb11(in_key[23:20],in_key[19:16],out_key[23:16]);
inv_sbox sb12(in_key[63:60],in_key[59:56],out_key[63:56]);

inv_sbox sb13(in_key[103:100],in_key[99:96],out_key[103:96]);
inv_sbox sb14(in_key[15:12],in_key[11:8],out_key[15:8]);
inv_sbox sb15(in_key[55:52],in_key[51:48],out_key[55:48]);
inv_sbox sb26(in_key[95:92],in_key[91:88],out_key[95:88]);


endmodule



