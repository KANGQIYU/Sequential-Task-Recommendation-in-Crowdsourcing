clear all
global alphaGRC;
global alphaURC;
global C;
warning off all
mkdir('.\common_setting');
settingpath = '.\common_setting\1.mat';
%common_setting(settingpath);
%alphaGRC = 1;
%alphaURC = 10; 
C = 0.1;
tic
aaaaa = [0.001 0.01 0.1 1 10];
for alpha = aaaaa
    alphaGRC = alpha;
savedatapath = ['.\result\ChangeAlpha\D1\GRC\'  num2str(alpha)];
%savedatapath = ['.\result\ChangeAlpha\D3\GRC\'  num2str(alpha)];
%savedatapath = ['.\result\ChangeAlpha\D4\GRC\'  num2str(alpha)];
%savedatapath = ['.\result\ChangeAlpha\D6\GRC\'  num2str(alpha)];
for i = 1:1000
    %UCBC(settingpath,savedatapath,i); NOT USE
    
    GRC(settingpath,savedatapath,i);
    %URC(settingpath,savedatapath,i);
    %NAIVE(settingpath,savedatapath,i);
end

end