% Function KS and save as KS.m
function [ round_out ] = KS( key,roundin )
% Key Schedule

RC=ones(10,1);
RC(1,1)=hex2dec('01');
RC(2,1)=hex2dec('02');
RC(3,1)=hex2dec('04');
RC(4,1)=hex2dec('08');
RC(5,1)=hex2dec('10');
RC(6,1)=hex2dec('20');
RC(7,1)=hex2dec('40');
RC(8,1)=hex2dec('80');
RC(9,1)=hex2dec('1b');
RC(10,1)=hex2dec('36');
round_out=ones(4,4);

if(roundin==0)
    round_out=key;
else
    w_0=key(:,1);
    w_1=key(:,2);
    w_2=key(:,3);
    w_3=key(:,4); 
    w_3_rot=circshift(w_3,3); 
    w_3_sub=ones(4,1);
 for i=1:4
    for j=1
        d=bitand(w_3_rot(i,j),15);
        e=bitshift(w_3_rot(i,j),-4);
        d=d+1;
        e=e+1;
        w_3_sub(i,j)=s_box(e,d);
    end
 end
    w_3_sub(1,1)=bitxor(w_3_sub(1,1),RC(roundin,1));
    w_4=bitxor(w_0,w_3_sub);
 for i=1:4
    for j=1:4
        if j==1
           round_out(i,j)=w_4(i,j);
        elseif j==2
            round_out(i,j)=bitxor(round_out(i,j-1),w_1(i,j-1));
        elseif j==3
            round_out(i,j)=bitxor(round_out(i,j-1),w_2(i,j-2));
        elseif j==4
            round_out(i,j)=bitxor(round_out(i,j-1),w_3(i,j-3));
        end
    end
 end
end
