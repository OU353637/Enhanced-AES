% aes structure
function [ text_out ] = aes_text(plaintext,key)
 key=[84 115 32 103;104 32 75 32;97 109 117 70;116 121 110 117];

% Key Input
 plaintext=[84 79 78 32;119 110 105 84;111 101 110 119;32 32 101 111];

a=plaintext;
b=key;
round_out=ARK(a,b);
round=1;
while round<10
    bs=BS(round_out);
    sr=SR(bs);
    mc=MC(sr);
    b=KS(b,round);
    round_out=ARK(mc,b);
    round=round+1;
end
bs=BS(round_out);
sr=SR(bs);
mc=sr;
b=KS(b,round);
round_out=ARK(mc,b);
clc;
disp(dec2hex(round_out));
text_out=round_out;

