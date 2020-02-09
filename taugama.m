function [ n ] = taugama( i, gama )
global alphaGAMA;
n = alphaGAMA*i.^gama;
end

