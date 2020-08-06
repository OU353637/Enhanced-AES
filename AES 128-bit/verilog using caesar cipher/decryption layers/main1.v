`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:49:53 04/18/2020 
// Design Name: 
// Module Name:    main1 
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
module main1(cyphertext,key,plaintext);
input [127:0]cyphertext;
input [127:0]key;
output [127:0]plaintext;


wire [127:0] en_key0,en_key1,en_key2,en_key3,en_key4,en_key5,en_key6,en_key7,en_key8,en_key9;
wire [127:0] is_key0,is_key1,is_key2,is_key3,is_key4,is_key5,is_key6,is_key7,is_key8,is_key9;
wire [127:0] ish_key0,ish_key1,ish_key2,ish_key3,ish_key4,ish_key5,ish_key6,ish_key7,ish_key8,ish_key9;
wire [127:0] imx_key0,imx_key1,imx_key2,imx_key3,imx_key4,imx_key5,imx_key6,imx_key7,imx_key8;
wire [127:0] gen_key0,gen_key1,gen_key2,gen_key3,gen_key4,gen_key5,gen_key6,gen_key7,gen_key8,gen_key9;
//wire [127:0] pr_key;
wire [127:0] cae_out;

//keys
key_gen k0(key,32'h01000000,gen_key0);
key_gen k1(gen_key0,32'h02000000,gen_key1);
key_gen k2(gen_key1,32'h04000000,gen_key2);
key_gen k3(gen_key2,32'h08000000,gen_key3);
key_gen k4(gen_key3,32'h10000000,gen_key4);
key_gen k5(gen_key4,32'h20000000,gen_key5);
key_gen k6(gen_key5,32'h40000000,gen_key6);
key_gen k7(gen_key6,32'h80000000,gen_key7);
key_gen k8(gen_key7,32'h1b000000,gen_key8);
key_gen k9(gen_key8,32'h36000000,gen_key9);

//round0
caeser_lyr c(cae_out,gen_key9,cyphertext);
//add_round_key_layr a0(cyphertext,gen_key9,en_key0);
add_round_key_layr a0(cae_out,gen_key9,en_key0);

inv_shift_row ish0(en_key0,ish_key0);

inv_sub_byte is0(ish_key0,is_key0);

//round1
add_round_key_layr a1(is_key0,gen_key8,en_key1);
inv_mix_col imx0(en_key1,imx_key0);
inv_shift_row ish1(imx_key0,ish_key1);
inv_sub_byte is1(ish_key1,is_key1);


//round2
add_round_key_layr a2(is_key1,gen_key7,en_key2);
inv_mix_col imx1(en_key2,imx_key1);
inv_shift_row ish2(imx_key1,ish_key2);
inv_sub_byte is2(ish_key2,is_key2);

//round3
add_round_key_layr a3(is_key2,gen_key6,en_key3);
inv_mix_col imx2(en_key3,imx_key2);
inv_shift_row ish3(imx_key2,ish_key3);
inv_sub_byte is3(ish_key3,is_key3);

//round4
add_round_key_layr a4(is_key3,gen_key5,en_key4);
inv_mix_col imx3(en_key4,imx_key3);
inv_shift_row ish4(imx_key3,ish_key4);
inv_sub_byte is4(ish_key4,is_key4);

//round5
add_round_key_layr a5(is_key4,gen_key4,en_key5);
inv_mix_col imx4(en_key5,imx_key4);
inv_shift_row ish5(imx_key4,ish_key5);
inv_sub_byte is5(ish_key5,is_key5);

//round6
add_round_key_layr a6(is_key5,gen_key3,en_key6);
inv_mix_col imx5(en_key6,imx_key5);
inv_shift_row ish6(imx_key5,ish_key6);
inv_sub_byte is6(ish_key6,is_key6);

//round7
add_round_key_layr a7(is_key6,gen_key2,en_key7);
inv_mix_col imx6(en_key7,imx_key6);
inv_shift_row ish7(imx_key6,ish_key7);
inv_sub_byte is7(ish_key7,is_key7);

//round8
add_round_key_layr a8(is_key7,gen_key1,en_key8);
inv_mix_col imx7(en_key8,imx_key7);
inv_shift_row ish8(imx_key7,ish_key8);
inv_sub_byte is8(ish_key8,is_key8);

//round9
add_round_key_layr a9(is_key8,gen_key0,en_key9);
inv_mix_col imx8(en_key9,imx_key8);
inv_shift_row ish9(imx_key8,ish_key9);
inv_sub_byte is9(ish_key9,is_key9);

//round10
add_round_key_layr a10(is_key9,key,plaintext);



endmodule
