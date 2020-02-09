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


settingpath = '.\common_setting\1.mat';
savedatapath = ['.\result\D1_only_interest'];
%common_setting(settingpath);%!!!!!!

alphaGRC = 0.1;
alphaURC = 0.1;
alphaGAMA = 0.1;
C = 0.1;

tic
for i = 1:1000
    
    GRC_only_interest(settingpath,savedatapath,i);
    URC_only_interest(settingpath,savedatapath,i);
    
end
toc
