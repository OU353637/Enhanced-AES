`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:49:55 04/17/2020 
// Design Name: 
// Module Name:    sbox 
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
module sbox(x,y,sbout);
input [0:3] x,y;
output reg [0:7] sbout;
reg [0:7] c;
always @(x,y)
begin	
c = {x,y};
case(c)
8'h00:sbout =8'h63;
8'h01:sbout =8'h7c;
8'h02:sbout =8'h77;
8'h03:sbout =8'h7b;
8'h04:sbout =8'hf2;
8'h05:sbout =8'h6b;
8'h06:sbout =8'h6f;
8'h07:sbout =8'hc5;
8'h08:sbout =8'h30;
8'h09:sbout =8'h01;
8'h0a:sbout =8'h67;
8'h0b:sbout =8'h2b;
8'h0c:sbout =8'hfe;
8'h0d:sbout =8'hd7;
8'h0e:sbout =8'hab;
8'h0f:sbout =8'h76;
8'h10:sbout =8'hca;
8'h11:sbout =8'h82;
8'h12:sbout =8'hc9;
8'h13:sbout =8'h7d;
8'h14:sbout =8'hfa;
8'h15:sbout =8'h59;
8'h16:sbout =8'h47;
8'h17:sbout =8'hf0;
8'h18:sbout =8'had;
8'h19:sbout =8'hd4;
8'h1a:sbout =8'ha2;
8'h1b:sbout =8'haf;
8'h1c:sbout =8'h9c;
8'h1d:sbout =8'ha4;
8'h1e:sbout =8'h72;
8'h1f:sbout =8'hc0;
8'h20:sbout =8'hb7;
8'h21:sbout =8'hfd;
8'h22:sbout =8'h93;
8'h23:sbout =8'h26;
8'h24:sbout =8'h36;
8'h25:sbout =8'h3f;
8'h26:sbout =8'hf7;
8'h27:sbout =8'hcc;
8'h28:sbout =8'h34;
8'h29:sbout =8'ha5;
8'h2a:sbout =8'he5;
8'h2b:sbout =8'hf1;
8'h2c:sbout =8'h71;
8'h2d:sbout =8'hd8;
8'h2e:sbout =8'h31;
8'h2f:sbout =8'h15;
8'h30:sbout =8'h04;
8'h31:sbout =8'hc7;
8'h32:sbout =8'h23;
8'h33:sbout =8'hc3;
8'h34:sbout =8'h18;
8'h35:sbout =8'h96;
8'h36:sbout =8'h05;
8'h37:sbout =8'h9a;
8'h38:sbout =8'h07;
8'h39:sbout =8'h12;
8'h3a:sbout =8'h80;
8'h3b:sbout =8'he2;
8'h3c:sbout =8'heb;
8'h3d:sbout =8'h27;
8'h3e:sbout =8'hb2;
8'h3f:sbout =8'h75;
8'h40:sbout =8'h09;
8'h41:sbout =8'h83;
8'h42:sbout =8'h2c;
8'h43:sbout =8'h1a;
8'h44:sbout =8'h1b;
8'h45:sbout =8'h6e;
8'h46:sbout =8'h5a;
8'h47:sbout =8'ha0;
8'h48:sbout =8'h52;
8'h49:sbout =8'h3b;
8'h4a:sbout =8'hd6;
8'h4b:sbout =8'hb3;
8'h4c:sbout =8'h29;
8'h4d:sbout =8'he3;
8'h4e:sbout =8'h2f;
8'h4f:sbout =8'h84;
8'h50:sbout =8'h53;
8'h51:sbout =8'hd1;
8'h52:sbout =8'h00;
8'h53:sbout =8'hed;
8'h54:sbout =8'h20;
8'h55:sbout =8'hfc;
8'h56:sbout =8'hb1;
8'h57:sbout =8'h5b;
8'h58:sbout =8'h6a;
8'h59:sbout =8'hcb;
8'h5a:sbout =8'hbe;
8'h5b:sbout =8'h39;
8'h5c:sbout =8'h4a;
8'h5d:sbout =8'h4c;
8'h5e:sbout =8'h58;
8'h5f:sbout =8'hcf;
8'h60:sbout =8'hd0;
8'h61:sbout =8'hef;
8'h62:sbout =8'haa;
8'h63:sbout =8'hfb;
8'h64:sbout =8'h43;
8'h65:sbout =8'h4d;
8'h66:sbout =8'h33;
8'h67:sbout =8'h85;
8'h68:sbout =8'h45;
8'h69:sbout =8'hf9;
8'h6a:sbout =8'h02;
8'h6b:sbout =8'h7f;
8'h6c:sbout =8'h50;
8'h6d:sbout =8'h3c;
8'h6e:sbout =8'h9f;
8'h6f:sbout =8'ha8;
8'h70:sbout =8'h51;
8'h71:sbout =8'ha3;
8'h72:sbout =8'h40;
8'h73:sbout =8'h8f;
8'h74:sbout =8'h92;
8'h75:sbout =8'h9d;
8'h76:sbout =8'h38;
8'h77:sbout =8'hf5;
8'h78:sbout =8'hbc;
8'h79:sbout =8'hb6;
8'h7a:sbout =8'hda;
8'h7b:sbout =8'h21;
8'h7c:sbout =8'h10;
8'h7d:sbout =8'hff;
8'h7e:sbout =8'hf3;
8'h7f:sbout =8'hd2;
8'h80:sbout =8'hcd;
8'h81:sbout =8'h0c;
8'h82:sbout =8'h13;
8'h83:sbout =8'hec;
8'h84:sbout =8'h5f;
8'h85:sbout =8'h97;
8'h86:sbout =8'h44;
8'h87:sbout =8'h17;
8'h88:sbout =8'hc4;
8'h89:sbout =8'ha7;
8'h8a:sbout =8'h7e;
8'h8b:sbout =8'h3d;
8'h8c:sbout =8'h64;
8'h8d:sbout =8'h5d;
8'h8e:sbout =8'h19;
8'h8f:sbout =8'h73;
8'h90:sbout =8'h60;
8'h91:sbout =8'h81;
8'h92:sbout =8'h4f;
8'h93:sbout =8'hdc;
8'h94:sbout =8'h22;
8'h95:sbout =8'h2a;
8'h96:sbout =8'h90;
8'h97:sbout =8'h88;
8'h98:sbout =8'h46;
8'h99:sbout =8'hee;
8'h9a:sbout =8'hb8;
8'h9b:sbout =8'h14;
8'h9c:sbout =8'hde;
8'h9d:sbout =8'h5e;
8'h9e:sbout =8'h0b;
8'h9f:sbout =8'hdb;
8'ha0:sbout =8'he0;
8'ha1:sbout =8'h32;
8'ha2:sbout =8'h3a;
8'ha3:sbout =8'h0a;
8'ha4:sbout =8'h49;
8'ha5:sbout =8'h06;
8'ha6:sbout =8'h24;
8'ha7:sbout =8'h5c;
8'ha8:sbout =8'hc2;
8'ha9:sbout =8'hd3;
8'haa:sbout =8'hac;
8'hab:sbout =8'h62;
8'hac:sbout =8'h91;
8'had:sbout =8'h95;
8'hae:sbout =8'he4;
8'haf:sbout =8'h79;
8'hb0:sbout =8'he7;
8'hb1:sbout =8'hc8;
8'hb2:sbout =8'h37;
8'hb3:sbout =8'h6d;
8'hb4:sbout =8'h8d;
8'hb5:sbout =8'hd5;
8'hb6:sbout =8'h4e;
8'hb7:sbout =8'ha9;
8'hb8:sbout =8'h6c;
8'hb9:sbout =8'h56;
8'hba:sbout =8'hf4;
8'hbb:sbout =8'hea;
8'hbc:sbout =8'h65;
8'hbd:sbout =8'h7a;
8'hbe:sbout =8'hae;
8'hbf:sbout =8'h08;
8'hc0:sbout =8'hba;
8'hc1:sbout =8'h78;
8'hc2:sbout =8'h25;
8'hc3:sbout =8'h2e;
8'hc4:sbout =8'h1c;
8'hc5:sbout =8'ha6;
8'hc6:sbout =8'hb4;
8'hc7:sbout =8'hc6;
8'hc8:sbout =8'he8;
8'hc9:sbout =8'hdd;
8'hca:sbout =8'h74;
8'hcb:sbout =8'h1f;
8'hcc:sbout =8'h4b;
8'hcd:sbout =8'hbd;
8'hce:sbout =8'h8b;
8'hcf:sbout =8'h8a;
8'hd0:sbout =8'h70;
8'hd1:sbout =8'h3e;
8'hd2:sbout =8'hb5;
8'hd3:sbout =8'h66;
8'hd4:sbout =8'h48;
8'hd5:sbout =8'h03;
8'hd6:sbout =8'hf6;
8'hd7:sbout =8'h0e;
8'hd8:sbout =8'h61;
8'hd9:sbout =8'h35;
8'hda:sbout =8'h57;
8'hdb:sbout =8'hb9;
8'hdc:sbout =8'h86;
8'hdd:sbout =8'hc1;
8'hde:sbout =8'h1d;
8'hdf:sbout =8'h9e;
8'he0:sbout =8'he1;
8'he1:sbout =8'hf8;
8'he2:sbout =8'h98;
8'he3:sbout =8'h11;
8'he4:sbout =8'h69;
8'he5:sbout =8'hd9;
8'he6:sbout =8'h8e;
8'he7:sbout =8'h94;
8'he8:sbout =8'h9b;
8'he9:sbout =8'h1e;
8'hea:sbout =8'h87;
8'heb:sbout =8'he9;
8'hec:sbout =8'hce;
8'hed:sbout =8'h55;
8'hee:sbout =8'h28;
8'hef:sbout =8'hdf;
8'hf0:sbout =8'h8c;
8'hf1:sbout =8'ha1;
8'hf2:sbout =8'h89;
8'hf3:sbout =8'h0d;
8'hf4:sbout =8'hbf;
8'hf5:sbout =8'he6;
8'hf6:sbout =8'h42;
8'hf7:sbout =8'h68;
8'hf8:sbout =8'h41;
8'hf9:sbout =8'h99;
8'hfa:sbout =8'h2d;
8'hfb:sbout =8'h0f;
8'hfc:sbout =8'hb0;
8'hfd:sbout =8'h54;
8'hfe:sbout =8'hbb;
8'hff:sbout =8'h16;
endcase
end

endmodule
