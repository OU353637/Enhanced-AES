
% byte substitution layer
function [ bs ] = BS( round_temp )
bs=ones(4,4);
for i=1:4
    for j=1:4
        c=round_temp(i,j);
        d=bitand(c,15);
        e=bitshift(c,-4);
        e=e+1;
        d=d+1;
        f=s_box(e,d);
        bs(i,j)=f;
    end
end
end
