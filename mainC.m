clear all
global alphaGRC;
global alphaURC;
global alphaGAMA;
global C;
warning off all
mkdir('.\common_setting');
settingpath = '.\common_setting\1.mat';
%settingpath = '.\common_setting\5.mat';


%common_setting(settingpath);%!!!!!!


alphaGRC = 0.1;
alphaURC = 0.1; 
alphaGAMA = 0.5;
%C = 0.1;

tic
aaaaa = [0.01 0.05 0.08 0.1 0.2 1];
for CCC = aaaaa
    C = CCC;
%savedatapath = ['.\result\arm30\' num2str(C)];
savedatapath = ['.\result\arm2\' num2str(C)];
for i = 1:1000
    %UCBC(settingpath,savedatapath,i); NOT USE
    
    GRC(settingpath,savedatapath,i);
    %NAIVE(settingpath,savedatapath,i);
end

end
toc
