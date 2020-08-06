% aes structure
%function [ actual_text ] = iaes(cyphertext,key)
key=[84 115 32 103;104 32 75 32;97 109 117 70;116 121 110 117];

cyphertext=[41 87 64 26;195 20 34 2;80 32 153 215;95 246 179 58];

a=cyphertext;
b=key;
round=10;
ark=ARK(a,IKS(b,round));
isr=ISR(ark);
round_out=IBS(isr);
round=round-1;
while round>0
    ark=ARK(round_out,IKS(b,round));
    imc=IMC(ark);
    isr=ISR(imc);
    round_out=IBS(isr);
    round=round-1;
end
round_out=ARK(round_out,key);
disp(round_out);
%actual_text=round_out;