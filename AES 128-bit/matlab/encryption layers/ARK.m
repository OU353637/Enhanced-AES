% Add round key layer
function [ ark ] = ARK( c,d )
ark=bitxor(c,d);
end
