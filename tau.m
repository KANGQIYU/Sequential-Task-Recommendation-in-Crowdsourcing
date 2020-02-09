function [ n ] = tau( i, j )
global alphaGRC;
global alphaURC;
%TAU Summary of this function goes here
%   Detailed explanation goes here
    if j == 1 %ucbc
        n = 0.1*i.^2;
    elseif j == 2
        n = alphaURC*i.^2;
    else
        n = alphaGRC*i.^2;
    end
end

