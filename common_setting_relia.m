%function common_setting(ppppath)

%                    1   2   3   4   5   6   7   8   9   10  11

clear all;
i = 100;
arms_reliability = [0.7 0.8 0.5*ones(1,7)]; 
arms_interest =    [0.9 0.5 0.5*ones(1,7)];

ppppath = ['common_setting\' num2str(i)];
% arms_reliability = [0.9 0.60]; 
% arms_interest =    [0.9 0.70];

runtimes =  100000;
bbeta = 1;
number_arms = length(arms_reliability);
variances = arms_reliability.*(1-arms_reliability);ppppath = ['common_setting\' num2str(i)];
save(ppppath);
i = i+1;



arms_reliability = [0.9 0.8 0.5*ones(1,7)]; 
arms_interest =    [0.7 0.5 0.5*ones(1,7)]; 
variances = arms_reliability.*(1-arms_reliability);ppppath = ['common_setting\' num2str(i)];
save(ppppath);
i = i+1;




arms_reliability = [0.9 0.5 0.5*ones(1,7)]; 
arms_interest =    [0.7 0.8 0.5*ones(1,7)];
variances = arms_reliability.*(1-arms_reliability);ppppath = ['common_setting\' num2str(i)];
save(ppppath);
i = i+1;



arms_reliability = [0.9 0.5 0.5*ones(1,7)]; 
arms_interest =    [0.5 0.7 0.5*ones(1,7)];
variances = arms_reliability.*(1-arms_reliability);ppppath = ['common_setting\' num2str(i)];
save(ppppath);
i = i+1;



arms_reliability = [0.5 0.5 0.5*ones(1,7)]; 
arms_interest =    [0.9 0.7 0.5*ones(1,7)];
variances = arms_reliability.*(1-arms_reliability);ppppath = ['common_setting\' num2str(i)];
save(ppppath);
i = i+1;


% arms_reliability = [0.9 0.6]; 
% arms_interest =    [0.9 0.6];
% variances = arms_reliability.*(1-arms_reliability);ppppath = ['common_setting\' num2str(i)];
% save(ppppath);
% i = i+1;
% 
% arms_reliability = [0.9 0.9]; 
% arms_interest =    [0.9 0.88];
% variances = arms_reliability.*(1-arms_reliability);ppppath = ['common_setting\' num2str(i)];
% save(ppppath);
% i = i+1;

%  arms_reliability = [0.9 0.6 0.5 0.5*ones(1,7)]; 
%  arms_interest =    [0.9 0.7 0.5 0.5*ones(1,7)];

% arms_reliability = [0.9 0.6 0.5*ones(1,28)]; 
% arms_interest =    [0.9 0.7 0.5*ones(1,28)];

% arms_reliability = [0.9 0.6 0.5*ones(1,98)]; 
% arms_interest =    [0.9 0.7 0.5*ones(1,98)];
%i = 19; i = i+1;