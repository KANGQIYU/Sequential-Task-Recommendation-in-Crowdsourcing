clear all
global alphaGRC;
global alphaURC;
global alphaGAMA;
global C;
warning off all
mkdir('.\common_setting');
distribution = 1;

switch distribution
    
    
    %%
    case 1
        settingpath = '.\common_setting\1.mat';
        savedatapath = ['.\result\D1'];
        %common_setting(settingpath);%!!!!!!
        
        alphaGRC = 0.1;
        alphaURC = 0.1; 
        alphaGAMA = 0.1;
        C = 0.1;
        
        tic
        for i = 1:1000
            %UCBC(settingpath,savedatapath,i); NOT USE
            
%             GRC(settingpath,savedatapath,i);
            URC(settingpath,savedatapath,i);
%             GAMA(settingpath,savedatapath,i,1);
% %             GAMA(settingpath,savedatapath,i,1.5);
            GAMA(settingpath,savedatapath,i,2);
% %             GAMA(settingpath,savedatapath,i,5);
%             GAMA(settingpath,savedatapath,i,10);
            NAIVE(settingpath,savedatapath,i);
%             GAMA(settingpath,savedatapath,i,2);
        end
        toc
        
        %%
    case 2
        settingpath = '.\common_setting\2.mat';
        savedatapath = ['.\result\D2'];
        %common_setting(settingpath);%!!!!!!
        
        alphaGRC = 0.52;
        alphaURC = 0.5; 
        alphaGAMA = 1;
        C = 0.1;
        
        tic
        for i = 1:1000
            %UCBC(settingpath,savedatapath,i); NOT USE
            
            GRC(settingpath,savedatapath,i);
            URC(settingpath,savedatapath,i);
            GAMA(settingpath,savedatapath,i,1);
            GAMA(settingpath,savedatapath,i,10);
            NAIVE(settingpath,savedatapath,i);
        end
        toc

        
        %%
    case 3
        settingpath = '.\common_setting\3.mat';
        savedatapath = ['.\result\D3'];
        %common_setting(settingpath);%!!!!!!
        
        alphaGRC = 0.1;
        alphaURC = 0.1; 
        alphaGAMA = 1;
        C = 0.08;
        
        tic
        for i = 1:1000
            %UCBC(settingpath,savedatapath,i); NOT USE
            
            GRC(settingpath,savedatapath,i);
            URC(settingpath,savedatapath,i);
%             GAMA(settingpath,savedatapath,i,1);
%             GAMA(settingpath,savedatapath,i,10);
%             NAIVE(settingpath,savedatapath,i);
        end
        toc
        
        %%
    case 4
        settingpath = '.\common_setting\4.mat';
        savedatapath = ['.\result\D4'];
        %common_setting(settingpath);%!!!!!!
        
        alphaGRC = 0.5;
        alphaURC = 0.5; 
        alphaGAMA = 1;
        C = 0.1;
        
        tic
        for i = 1:1000
            %UCBC(settingpath,savedatapath,i); NOT USE
            
            %GRC(settingpath,savedatapath,i);
            %URC(settingpath,savedatapath,i);
            %GAMA(settingpath,savedatapath,i,1);
            GAMA(settingpath,savedatapath,i,11);
            %NAIVE(settingpath,savedatapath,i);
        end
        toc
        
        %%
    case 5
        settingpath = '.\common_setting\5.mat';
        savedatapath = ['.\result\D5'];
        %common_setting(settingpath);%!!!!!!
        
        alphaGRC = 0.5;
        alphaURC = 0.5; 
        alphaGAMA = 1;
        C = 0.1;
        
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
                %%
    case 6
        settingpath = '.\common_setting\6.mat';
        savedatapath = ['.\result\D6'];
        %common_setting(settingpath);%!!!!!!
        
        alphaGRC = 0.5;
        alphaURC = 0.5; 
        alphaGAMA = 1;
        C = 0.1;
        
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
    otherwise
         settingpath = '.\common_setting\1.mat';
        savedatapath = ['.\result\delta\D1'];
        alphaGRC = 0.5;
        alphaURC = 0.5;
        alphaGAMA = 1;
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
end
