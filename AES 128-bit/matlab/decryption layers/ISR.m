function [ isr ] = ISR( ibs )
isr=ibs;
for i=2:4
    if(i==2)
        for j=1:4
            if(j==1)
                isr(i,j)=ibs(i,j+3);
            else
                isr(i,j)=ibs(i,j-1);
            end
        end
    end
    if(i==3)
        for j=1:4
            if((j==3)||(j==4))
                isr(i,j)=ibs(i,j-2);
            else
                isr(i,j)=ibs(i,j+2);
            end
        end
    end
    if(i==4)
        for j=1:4
            if((j==1)||(j==2)||(j==3))
                isr(i,j)=ibs(i,j+1);
            else
                isr(i,j)=ibs(i,j-3);
            end
        end
    end
end
end