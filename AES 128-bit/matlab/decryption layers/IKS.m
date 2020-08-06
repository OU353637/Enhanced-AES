% Function IKS and save as IKS.m
function [ roundout ] = IKS( key,roundin )
% Key Schedule
b=ones(10,1); 
b(1,1)=hex2dec('01');
b(2,1)=hex2dec('02');
b(3,1)=hex2dec('04');
b(4,1)=hex2dec('08');
b(5,1)=hex2dec('10');
b(6,1)=hex2dec('20');
b(7,1)=hex2dec('40');
b(8,1)=hex2dec('80');
b(9,1)=hex2dec('1b');
b(10,1)=hex2dec('36');
 
round0=key;
% W(0)
w_0=ones(4,1);
for i=1:4
    for j=1
        w_0(i,j)=round0(i,j);
    end
end
 
 
% W(1)
w_1=ones(4,1);
for i=1:4
    for j=1
        w_1(i,j)=round0(i,j+1);
    end
end
 
 
% W(2)
w_2=ones(4,1);
for i=1:4
    for j=1
        w_2(i,j)=round0(i,j+2);
    end
end
 
 
% W(3)
w_3=ones(4,1);
for i=1:4
    for j=1
        w_3(i,j)=round0(i,j+3);
    end
end
 
% Round 1
w_3_rot=ones(4,1);
temp=w_3(1,1);
for i=1:3
    for j=1
        w_3_rot(i,j)=w_3(i+1,j);
    end
end
w_3_rot(4,1)=temp;
 
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
 
 
w_3_temp=w_3_sub;
w_3_temp(1,1)=bitxor(w_3_sub(1,1),b(1,1));
 
 
w_4=ones(4,1);
for i=1:4
    for j=1
        w_4(i,j)=bitxor(w_0(i,j),w_3_temp(i,j));
    end
end
 
round1=ones(4,4);
for i=1:4
    for j=1
        round1(i,j)=w_4(i,j);
    end
end
 
for i=1:4
    for j=2:4
        if j==2
            round1(i,j)=bitxor(round1(i,j-1),w_1(i,j-1));
        elseif j==3
            round1(i,j)=bitxor(round1(i,j-1),w_2(i,j-2));
        elseif j==4
            round1(i,j)=bitxor(round1(i,j-1),w_3(i,j-3));
        end
    end
end
 
% Round 2
w_7=ones(4,1);
for i=1:4
    for j=1
        w_7(i,j)=round1(i,j+3);
    end
end
 
w_7_rot=ones(4,1);
temp=w_7(1,1);
for i=1:3
    for j=1
        w_7_rot(i,j)=w_7(i+1,j);
    end
end
w_7_rot(4,1)=temp;
 
 
w_7_sub=ones(4,1);
for i=1:4
    for j=1
        d=bitand(w_7_rot(i,j),15);
        e=bitshift(w_7_rot(i,j),-4);
        d=d+1;
        e=e+1;
        w_7_sub(i,j)=s_box(e,d);
    end
end
 
 
w_7_temp=w_7_sub;
w_7_temp(1,1)=bitxor(w_7_sub(1,1),b(2,1));
 
 
w_8=ones(4,1);
for i=1:4
    for j=1
        w_8(i,j)=bitxor(w_4(i,j),w_7_temp(i,j));
    end
end
 
 
round2=ones(4,4);
for i=1:4
    for j=1
        round2(i,j)=w_8(i,j);
    end
end
 
for i=1:4
    for j=2:4
        if j==2
            round2(i,j)=bitxor(round2(i,j-1),round1(i,j));
        elseif j==3
            round2(i,j)=bitxor(round2(i,j-1),round1(i,j));
        elseif j==4
            round2(i,j)=bitxor(round2(i,j-1),round1(i,j));
        end
    end
end
 
 
% Round 3
w_11=ones(4,1);
for i=1:4
    for j=1
        w_11(i,j)=round2(i,j+3);
    end
end
 
w_11_rot=ones(4,1);
temp=w_11(1,1);
for i=1:3
    for j=1
        w_11_rot(i,j)=w_11(i+1,j);
    end
end
w_11_rot(4,1)=temp;
 
 
w_11_sub=ones(4,1);
for i=1:4
    for j=1
        d=bitand(w_11_rot(i,j),15);
        e=bitshift(w_11_rot(i,j),-4);
        d=d+1;
        e=e+1;
        w_11_sub(i,j)=s_box(e,d);
    end
end
 
 
w_11_temp=w_11_sub;
w_11_temp(1,1)=bitxor(w_11_sub(1,1),b(3,1));
 
 
w_12=ones(4,1);
for i=1:4
    for j=1
        w_12(i,j)=bitxor(w_8(i,j),w_11_temp(i,j));
    end
end
 
 
round3=ones(4,4);
for i=1:4
    for j=1
        round3(i,j)=w_12(i,j);
    end
end
 
for i=1:4
    for j=2:4
        if j==2
            round3(i,j)=bitxor(round3(i,j-1),round2(i,j));
        elseif j==3
            round3(i,j)=bitxor(round3(i,j-1),round2(i,j));
        elseif j==4
            round3(i,j)=bitxor(round3(i,j-1),round2(i,j));
        end
    end
end
 
 
% Round 4
w_15=ones(4,1);
for i=1:4
    for j=1
        w_15(i,j)=round3(i,j+3);
    end
end
 
w_15_rot=ones(4,1);
temp=w_15(1,1);
for i=1:3
    for j=1
        w_15_rot(i,j)=w_15(i+1,j);
    end
end
w_15_rot(4,1)=temp;

 
w_15_sub=ones(4,1);
for i=1:4
    for j=1
        d=bitand(w_15_rot(i,j),15);
        e=bitshift(w_15_rot(i,j),-4);
        d=d+1;
        e=e+1;
        w_15_sub(i,j)=s_box(e,d);
    end
end
 
 
w_15_temp=w_15_sub;
w_15_temp(1,1)=bitxor(w_15_sub(1,1),b(4,1));
 
 
w_16=ones(4,1);
for i=1:4
    for j=1
        w_16(i,j)=bitxor(w_12(i,j),w_15_temp(i,j));
    end
end
 
 
round4=ones(4,4);
for i=1:4
    for j=1
        round4(i,j)=w_16(i,j);
    end
end
 
for i=1:4
    for j=2:4
        if j==2
            round4(i,j)=bitxor(round4(i,j-1),round3(i,j));
        elseif j==3
            round4(i,j)=bitxor(round4(i,j-1),round3(i,j));
        elseif j==4
            round4(i,j)=bitxor(round4(i,j-1),round3(i,j));
        end
    end
end
 
 
% Round 5
w_19=ones(4,1);
for i=1:4
    for j=1
        w_19(i,j)=round4(i,j+3);
    end
end
 
w_19_rot=ones(4,1);
temp=w_19(1,1);
for i=1:3
    for j=1
        w_19_rot(i,j)=w_19(i+1,j);
    end
end
w_19_rot(4,1)=temp;
 
 
w_19_sub=ones(4,1);
for i=1:4
    for j=1
        d=bitand(w_19_rot(i,j),15);
        e=bitshift(w_19_rot(i,j),-4);
        d=d+1;
        e=e+1;
        w_19_sub(i,j)=s_box(e,d);
    end
end
 
 
w_19_temp=w_19_sub;
w_19_temp(1,1)=bitxor(w_19_sub(1,1),b(5,1));
 
 
w_20=ones(4,1);
for i=1:4
    for j=1
        w_20(i,j)=bitxor(w_16(i,j),w_19_temp(i,j));
    end
end
 
 
round5=ones(4,4);
for i=1:4
    for j=1
        round5(i,j)=w_20(i,j);
    end
end
 
for i=1:4
    for j=2:4
        if j==2
            round5(i,j)=bitxor(round5(i,j-1),round4(i,j));
        elseif j==3
            round5(i,j)=bitxor(round5(i,j-1),round4(i,j));
        elseif j==4
            round5(i,j)=bitxor(round5(i,j-1),round4(i,j));
        end
    end
end
 
% Round 6
w_23=ones(4,1);
for i=1:4
    for j=1
        w_23(i,j)=round5(i,j+3);
    end
end
 
w_23_rot=ones(4,1);
temp=w_23(1,1);
for i=1:3
    for j=1
        w_23_rot(i,j)=w_23(i+1,j);
    end
end
w_23_rot(4,1)=temp;
 
 
w_23_sub=ones(4,1);
for i=1:4
    for j=1
        d=bitand(w_23_rot(i,j),15);
        e=bitshift(w_23_rot(i,j),-4);
        d=d+1;
        e=e+1;
        w_23_sub(i,j)=s_box(e,d);
    end
end
 
w_23_temp=w_23_sub;
w_23_temp(1,1)=bitxor(w_23_sub(1,1),b(6,1));
 
w_24=ones(4,1);
for i=1:4
    for j=1
        w_24(i,j)=bitxor(w_20(i,j),w_23_temp(i,j));
    end
end
 
round6=ones(4,4);
for i=1:4
    for j=1
        round6(i,j)=w_24(i,j);
    end
end
 
for i=1:4
    for j=2:4
        if j==2
            round6(i,j)=bitxor(round6(i,j-1),round5(i,j));
        elseif j==3
            round6(i,j)=bitxor(round6(i,j-1),round5(i,j));
        elseif j==4
            round6(i,j)=bitxor(round6(i,j-1),round5(i,j));
        end
    end
end
 
% Round 7
w_27=ones(4,1);
for i=1:4
    for j=1
        w_27(i,j)=round6(i,j+3);
    end
end
 
w_27_rot=ones(4,1);
temp=w_27(1,1);
for i=1:3
    for j=1
        w_27_rot(i,j)=w_27(i+1,j);
    end
end
w_27_rot(4,1)=temp;
 
w_27_sub=ones(4,1);
for i=1:4
    for j=1
        d=bitand(w_27_rot(i,j),15);
        e=bitshift(w_27_rot(i,j),-4);
        d=d+1;
        e=e+1;
        w_27_sub(i,j)=s_box(e,d);
    end
end
 
w_27_temp=w_27_sub;
w_27_temp(1,1)=bitxor(w_27_sub(1,1),b(7,1));
 
w_28=ones(4,1);
for i=1:4
    for j=1
        w_28(i,j)=bitxor(w_24(i,j),w_27_temp(i,j));
    end
end
 
round7=ones(4,4);
for i=1:4
    for j=1
        round7(i,j)=w_28(i,j);
    end
end
 
for i=1:4
    for j=2:4
        if j==2
            round7(i,j)=bitxor(round7(i,j-1),round6(i,j));
        elseif j==3
            round7(i,j)=bitxor(round7(i,j-1),round6(i,j));
        elseif j==4
            round7(i,j)=bitxor(round7(i,j-1),round6(i,j));
        end
    end
end
 
% Round 8
w_31=ones(4,1);
for i=1:4
    for j=1
        w_31(i,j)=round7(i,j+3);
    end
end
 
w_31_rot=ones(4,1);
temp=w_31(1,1);
for i=1:3
    for j=1
        w_31_rot(i,j)=w_31(i+1,j);
    end
end
w_31_rot(4,1)=temp;
 
w_31_sub=ones(4,1);
for i=1:4
    for j=1
        d=bitand(w_31_rot(i,j),15);
        e=bitshift(w_31_rot(i,j),-4);
        d=d+1;
        e=e+1;
        w_31_sub(i,j)=s_box(e,d);
    end
end
 
w_31_temp=w_31_sub;
w_31_temp(1,1)=bitxor(w_31_sub(1,1),b(8,1));
 
w_32=ones(4,1);
for i=1:4
    for j=1
        w_32(i,j)=bitxor(w_28(i,j),w_31_temp(i,j));
    end
end
 
round8=ones(4,4);
for i=1:4
    for j=1
        round8(i,j)=w_32(i,j);
    end
end
 
for i=1:4
    for j=2:4
        if j==2
            round8(i,j)=bitxor(round8(i,j-1),round7(i,j));
        elseif j==3
            round8(i,j)=bitxor(round8(i,j-1),round7(i,j));
        elseif j==4
            round8(i,j)=bitxor(round8(i,j-1),round7(i,j));
        end
    end
end
 
% Round 9
w_35=ones(4,1);
for i=1:4
    for j=1
        w_35(i,j)=round8(i,j+3);
    end
end
 
w_35_rot=ones(4,1);
temp=w_35(1,1);
for i=1:3
    for j=1
        w_35_rot(i,j)=w_35(i+1,j);
    end
end
w_35_rot(4,1)=temp;
 
w_35_sub=ones(4,1);
for i=1:4
    for j=1
        d=bitand(w_35_rot(i,j),15);
        e=bitshift(w_35_rot(i,j),-4);
        d=d+1;
        e=e+1;
        w_35_sub(i,j)=s_box(e,d);
    end
end
 
w_35_temp=w_35_sub;
w_35_temp(1,1)=bitxor(w_35_sub(1,1),b(9,1));
 
w_36=ones(4,1);
for i=1:4
    for j=1
        w_36(i,j)=bitxor(w_32(i,j),w_35_temp(i,j));
    end
end
 
round9=ones(4,4);
for i=1:4
    for j=1
        round9(i,j)=w_36(i,j);
    end
end
 
for i=1:4
    for j=2:4
        if j==2
            round9(i,j)=bitxor(round9(i,j-1),round8(i,j));
        elseif j==3
            round9(i,j)=bitxor(round9(i,j-1),round8(i,j));
        elseif j==4
            round9(i,j)=bitxor(round9(i,j-1),round8(i,j));
        end
    end
end
 
% Round 9
w_39=ones(4,1);
for i=1:4
    for j=1
        w_39(i,j)=round9(i,j+3);
    end
end
 
w_39_rot=ones(4,1);
temp=w_39(1,1);
for i=1:3
    for j=1
        w_39_rot(i,j)=w_39(i+1,j);
    end
end
w_39_rot(4,1)=temp;
 
w_39_sub=ones(4,1);
for i=1:4
    for j=1
        d=bitand(w_39_rot(i,j),15);
        e=bitshift(w_39_rot(i,j),-4);
        d=d+1;
        e=e+1;
        w_39_sub(i,j)=s_box(e,d);
    end
end
 
 
w_39_temp=w_39_sub;
w_39_temp(1,1)=bitxor(w_39_sub(1,1),b(10,1));
 
 
w_40=ones(4,1);
for i=1:4
    for j=1
        w_40(i,j)=bitxor(w_36(i,j),w_39_temp(i,j));
    end
end
 
 
round10=ones(4,4);
for i=1:4
    for j=1
        round10(i,j)=w_40(i,j);
    end
end
 
for i=1:4
    for j=2:4
        if j==2
            round10(i,j)=bitxor(round10(i,j-1),round9(i,j));
        elseif j==3
            round10(i,j)=bitxor(round10(i,j-1),round9(i,j));
        elseif j==4
            round10(i,j)=bitxor(round10(i,j-1),round9(i,j));
        end
    end
end
 
 
 
if roundin==0
    roundout=round0;
elseif roundin==1
    roundout=round1;
elseif roundin==2
    roundout=round2;
elseif roundin==3
    roundout=round3;
elseif roundin==4
    roundout=round4;
elseif roundin==5
    roundout=round5;
elseif roundin==6
    roundout=round6;
elseif roundin==7
    roundout=round7;
elseif roundin==8
    roundout=round8;
elseif roundin==9
    roundout=round9;
elseif roundin==10;
    roundout=round10;
end   
end
