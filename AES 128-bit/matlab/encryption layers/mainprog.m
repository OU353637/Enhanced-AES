% Main Program and saved as finalout.m
clc;
clear all;

% key input
key=[84 115 32 103;104 32 75 32;97 109 117 70;116 121 110 117];
%key=[84 104 97 116;115 32 109 121;32 75 117 110;103 32 70 117];
% plaintext Input
plaintext=[84 79 78 32;119 110 105 84;111 101 110 119;32 32 101 111];
%plaintext=[84 119 111 32;79 110 101 32;78 105 110 101;32 84 119 111];


% Output

text_out=aes_text(plaintext,key);

disp('Plaintext is as follows');
disp(dec2hex(plaintext));

disp('Key is as follows');
disp(dec2hex(key));

disp('encrypted plaintext');
disp(text_out);