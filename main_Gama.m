clear all
global alphaGRC;
global alphaURC;
global alphaGAMA;
global C;
warning off all


settingpath = '.\common_setting\200.mat';
savedatapath = ['.\result\GAMA0.5'];
% alphaGRC = 0.5;
% alphaURC = 0.5;
alphaGAMA = 0.5;
%C = 0.1;
tic
%aaaaa = [1 1.5 1.8 1.9 2 2.1 2.2 2.5 3 4 6 10];
aaaaa = 4;%[1.5 1.8 1.9 2 2.1 2.2 2.5 3 4 6 10];
for gama = aaaaa
%savedatapath = ['.\result\arm30\' num2str(C)];

for i = 1:2000
    GAMA(settingpath,savedatapath,i,gama);
end

end


toc