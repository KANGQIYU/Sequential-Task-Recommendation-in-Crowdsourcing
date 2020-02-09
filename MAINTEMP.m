clear all

warning off all
%mkdir('.\common_setting');
%settingpath = '.\common_setting\1.mat';
%settingpath = '.\common_setting\5.mat';

i = 100;
arms_reliability = [0.7 0.5];
arms_interest =    [0.9 0.8 ];

ppppath = ['common_setting\' num2str(i)];
% arms_reliability = [0.9 0.60];
% arms_interest =    [0.9 0.70];

runtimes =  100000;
bbeta = 1;
number_arms = length(arms_reliability);
variances = arms_reliability.*(1-arms_reliability);ppppath = ['common_setting\' num2str(i)];
save(ppppath);

settingpath = '.\common_setting\100.mat';
savedatapath = ['.\result\D' num2str(i)];
%common_setting(settingpath);%!!!!!!
global alphaGRC;
global alphaURC;
global C;
alphaGRC = 0.5;
alphaURC = 0.5;
%alphaGAMA = 1;
C = 0.5;

tic
for i = 1:1000
    %UCBC(settingpath,savedatapath,i); NOT USE
    
    GRC(settingpath,savedatapath,i);
    URC(settingpath,savedatapath,i);
    %GAMA(settingpath,savedatapath,i,1);
    %GAMA(settingpath,savedatapath,i,10);
    %NAIVE(settingpath,savedatapath,i);
end
toc
