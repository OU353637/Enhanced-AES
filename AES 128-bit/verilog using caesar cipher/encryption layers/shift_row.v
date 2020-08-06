`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:51:11 04/17/2020 
// Design Name: 
// Module Name:    shift_row 
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
module shift_row(s_state,shifted_state);
input [127:0] s_state;
inout [127:0] shifted_state;

assign shifted_state[7:0]   = s_state[39:32];//0 
assign shifted_state[15:8] = s_state[79:72];//1
assign shifted_state[23:16] = s_state[119:112];//2
assign shifted_state[31:24] = s_state[31:24];//3

assign shifted_state[39:32] = s_state[71:64];//4
assign shifted_state[47:40] = s_state[111:104];//5
assign shifted_state[55:48] = s_state[23:16];//6
assign shifted_state[63:56] = s_state[63:56];//7

assign shifted_state[71:64] = s_state[103:96];//8
assign shifted_state[79:72] = s_state[15:8];//9
assign shifted_state[87:80] = s_state[55:48];//10
assign shifted_state[95:88] = s_state[95:88];//11

assign shifted_state[103:96] = s_state[7:0];//12
assign shifted_state[111:104] = s_state[47:40];//13s
assign shifted_state[119:112] = s_state[87:80];//14
assign shifted_state[127:120] = s_state[127:120];//15
endmodule
