`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:47:16 04/17/2020 
// Design Name: 
// Module Name:    main 
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
module main(plaintext,key,cyphertext);
input [127:0]plaintext;
input [127:0]key;
output [127:0]cyphertext;


wire [127:0] en_key0,en_key1,en_key2,en_key3,en_key4,en_key5,en_key6,en_key7,en_key8;
wire [127:0] s_key0,s_key1,s_key2,s_key3,s_key4,s_key5,s_key6,s_key7,s_key8,s_key9;
wire [127:0] sh_key0,sh_key1,sh_key2,sh_key3,sh_key4,sh_key5,sh_key6,sh_key7,sh_key8,sh_key9;
wire [127:0] mx_key0,mx_key1,mx_key2,mx_key3,mx_key4,mx_key5,mx_key6,mx_key7,mx_key8;
wire [127:0] gen_key0,gen_key1,gen_key2,gen_key3,gen_key4,gen_key5,gen_key6,gen_key7,gen_key8,gen_key9;
wire [127:0] pr_key;
wire [127:0] cae_in;

//****************************round0*****************************************

assign pr_key = plaintext^key;

//*****************************round1*****************************************

//sub bytes operation

sub_byte s0(pr_key,s_key0);


//shift row

shift_row sh0(s_key0,sh_key0);


//mix column

mix_col   m0(sh_key0,mx_key0);


//add round key operation

key_gen k0(key,32'h01000000,gen_key0);

add_round_key_layr a0(gen_key0,mx_key0,en_key0);


//****************************************ROUND2********************************

//sub bytes operation

sub_byte s1(en_key0,s_key1);

shift_row sh1(s_key1,sh_key1);
//mix column

mix_col  m1(sh_key1,mx_key1);

//add round key operation

key_gen k1(gen_key0,32'h02000000,gen_key1);

add_round_key_layr a1(gen_key1,mx_key1,en_key1);


//******************************ROUND3**************************************

//sub bytes operation

sub_byte s2(en_key1,s_key2);

shift_row sh2(s_key2,sh_key2);

//mix column

mix_col  m2(sh_key2,mx_key2);

//add round key operation

key_gen k2(gen_key1,32'h04000000,gen_key2);

add_round_key_layr a2(gen_key2,mx_key2,en_key2);


//*******************************ROUND4************************************

//sub bytes operation

sub_byte s3(en_key2,s_key3);

//mix column
shift_row sh3(s_key3,sh_key3);

mix_col  m3(sh_key3,mx_key3);

//add round key operation

key_gen k3(gen_key2,32'h08000000,gen_key3);
add_round_key_layr a3(gen_key3,mx_key3,en_key3);


//*********************************ROUND5*********************************

//sub bytes operation

sub_byte s4(en_key3,s_key4);

//mix column
shift_row sh4(s_key4,sh_key4);

mix_col  m4(sh_key4,mx_key4);

//add round key operation

key_gen k4(gen_key3,32'h10000000,gen_key4);
add_round_key_layr a4(gen_key4,mx_key4,en_key4);


//**********************************ROUND6**********************************

//sub bytes operation

sub_byte s5(en_key4,s_key5);

//mix column
shift_row sh5(s_key5,sh_key5);

mix_col  m5(sh_key5,mx_key5);

//add round key operation

key_gen k5(gen_key4,32'h20000000,gen_key5);
add_round_key_layr a5(gen_key5,mx_key5,en_key5);


//*******************************ROUND7*************************************

//sub bytes operation

sub_byte s6(en_key5,s_key6);
shift_row sh6(s_key6,sh_key6);

//mix column

mix_col  m6(sh_key6,mx_key6);

//add round key operation

key_gen k6(gen_key5,32'h40000000,gen_key6);
add_round_key_layr a6(gen_key6,mx_key6,en_key6);


//**************************ROUND8********************************************

//sub bytes operation

sub_byte s7(en_key6,s_key7);
shift_row sh7(s_key7,sh_key7);

//mix column

mix_col  m7(sh_key7,mx_key7);

//add round key operation

key_gen k7(gen_key6,32'h80000000,gen_key7);
add_round_key_layr a7(gen_key7,mx_key7,en_key7);


//****************************ROUND9*****************************************

//sub bytes operation

sub_byte s8(en_key7,s_key8);

shift_row sh8(s_key8,sh_key8);

//mix column

mix_col  m8(sh_key8,mx_key8);

//add round key operation

key_gen k8(gen_key7,32'h1b000000,gen_key8);
add_round_key_layr a8(gen_key8,mx_key8,en_key8);




//********************************FINAL ROUND**********************************

//sub bytes operation

sub_byte s9(en_key8,s_key9);

//shift row

shift_row sh9(s_key9,sh_key9);

//no mix column

//add round key operation

key_gen k9(gen_key8,32'h36000000,gen_key9);
//add_round_key_layr a9(gen_key9,sh_key9,cyphertext);
add_round_key_layr a9(gen_key9,sh_key9,cae_in);
caeser_lyr c(cyphertext,gen_key9,cae_in);



endmodule
