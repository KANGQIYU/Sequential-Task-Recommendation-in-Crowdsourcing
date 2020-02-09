clear all
global alphaGRC;
global alphaURC;
global alphaGAMA;
global C;
warning off all



alphaGRC = 0.5;
alphaURC = 0.5;
alphaGAMA = 1;
C = 0.1;

for ii = 26
settingpath = ['.\common_setting\' num2str(ii) '.mat'];
savedatapath = ['.\result\D' num2str(ii)];

for i = 1:1000
    %UCBC(settingpath,savedatapath,i); NOT USE
    
    GRC(settingpath,savedatapath,i);
    URC(settingpath,savedatapath,i);

end    
end

