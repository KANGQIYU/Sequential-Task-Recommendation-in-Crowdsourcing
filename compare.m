clear all
load('.\common_setting\GBC.mat');
plot(time,regret);hold on;




load('.\common_setting\URC.mat');
plot(time,regret);

ax=legend('UCBC','URC'); 