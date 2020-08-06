% MadC Function and name as MadC.m
function [ temp ] = MadC(a1,b1)

if a1==1
    temp=b1;
elseif a1==2
        b1=bitshift(b1,1);
        for i=15:-1:8
            x=27;
            if(bitget(b1,i+1))
                b1=bitset(b1,i+1,0);
                x=bitshift(x,i-8);
                b1=bitxor(b1,x);
            end
        end
        temp=b1;
elseif a1==3
    b1_1=b1;
    x=MadC(2,b1_1);
    x1=bitxor(b1_1,x);
    temp=x1;
elseif a1==4
    b1=bitshift(b1,2);
        for i=15:-1:8
            x=27;
            if(bitget(b1,i+1))
                b1=bitset(b1,i+1,0);
                x=bitshift(x,i-8);
                b1=bitxor(b1,x);
            end
        end
        temp=b1;
elseif a1==8
    b1=bitshift(b1,3);
        for i=15:-1:8
            x=27;
            if(bitget(b1,i+1))
                b1=bitset(b1,i+1,0);
                x=bitshift(x,i-8);
                b1=bitxor(b1,x);
            end
        end
        temp=b1;
elseif a1==9
    b1_1=b1;
    x=MadC(8,b1_1);
    x1=bitxor(x,b1_1);
    temp=x1;
elseif a1==11
    b1_1=b1;
    x=MadC(2,b1_1);
    x1=MadC(8,b1_1);
    x2=bitxor(bitxor(x,x1),b1_1);
    temp=x2;
elseif a1==13
    b1_1=b1;
    x=MadC(4,b1_1);
    x1=MadC(8,b1_1);
    x2=bitxor(bitxor(x,x1),b1_1);
    temp=x2;
elseif a1==14
    b1_1=b1;
    x=MadC(8,b1_1);
    x1=MadC(4,b1_1);
    x2=MadC(2,b1_1);
    x3=bitxor(bitxor(x1,x),x2);
    temp=x3;
end
