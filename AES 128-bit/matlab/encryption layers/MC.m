% mixing columns layer
function [ mc ] = MC( sr )
 
mc_pre=[2 3 1 1;1 2 3 1;1 1 2 3;3 1 1 2];
a=mc_pre;
% a=gf(mc_pre,8);
% k=sr;
% b=gf(k,8);
% c=a*b;
b=sr;
c=ones(4,4);
for var1=1:4
    for var2=1:4
        temp1=MadC(a(var1,1),b(1,var2));
        temp2=MadC(a(var1,2),b(2,var2));
        temp3=MadC(a(var1,3),b(3,var2));
        temp4=MadC(a(var1,4),b(4,var2));
        temp1=bitxor(temp1,temp2);
        temp1=bitxor(temp1,temp3);
        temp1=bitxor(temp1,temp4);
        c(var1,var2)=temp1;
    end
end
mc=c;
