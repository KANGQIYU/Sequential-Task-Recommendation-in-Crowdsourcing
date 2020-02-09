function URC(name, ith)
load('.\common_setting\1.mat');
% number_arms = 10;
% arms_reliability
% arms_interest
% runtimes =  100000;

arms_product = arms_interest.*arms_reliability;
all_epoch = ceil(sqrt(runtimes/number_arms));
Xave = zeros(number_arms,1); %average X, length number_arms
arms_epoch = zeros(number_arms,1);

chosenarms_history = zeros(all_epoch,1); %indicate the arm chosen in the epoches
goldaccept_history = zeros(number_arms,all_epoch); %indicate the gold one is accept(1) or not(0)
goldanswer_history = zeros(number_arms,all_epoch); %only applicable when goldaccept_history is 1(accept)
goldvariance_history = zeros(number_arms,all_epoch);
reward = zeros(number_arms+1,1);
regret = zeros(all_epoch,1);
time = zeros(all_epoch,1);

%before game
ggold = rand(number_arms,1)<arms_reliability';



%main part
for i = 1:all_epoch-1

    goldaccept_history(:,i) = rand(number_arms,1)<(arms_interest');
    goldanswer_history(:,i) = rand(number_arms,1)<(arms_reliability');
    Xave = (Xave*(i-1)+goldaccept_history(:,i).* goldanswer_history(:,i))./i;
    [~,arm_chosen] = max(Xave,[],1);
    chosenarms_history(i) = arm_chosen;
    arms_epoch(arm_chosen)= arms_epoch(arm_chosen)+1;
    time(i) = number_arms*i^2;
    temp = [goldanswer_history(arm_chosen,goldaccept_history(arm_chosen,:)==1) ggold(arm_chosen)];
    if length(temp)>1
        goldvariance_history(i) = sum((temp-mean(temp)).^2)/(length(temp)-1);
    else
        goldvariance_history(i) = 1/4;
    end
    length_current_epoch = 2*number_arms*(i-1);
    accept = rand(length_current_epoch,1)<arms_interest(arm_chosen);
    answers = rand(length_current_epoch,1)<arms_reliability(arm_chosen);
    reward(i+1) = reward(i) + sum(answers((accept==1))-bbeta*goldvariance_history(i)/length(temp));
    regret(i) = max(arms_product)*time(i)-reward(i+1);
end

if time(all_epoch-1)+number_arms<runtimes
    goldaccept_history(:,all_epoch) = rand(number_arms,1)<(arms_interest');
    goldanswer_history(:,all_epoch) = rand(number_arms,1)<(arms_reliability');
    Xave = (Xave*(all_epoch-1)+goldaccept_history(:,all_epoch).* goldanswer_history(:,all_epoch))./all_epoch;
    [~,arm_chosen] = max(Xave,[],1);
    chosenarms_history(i) = arm_chosen;
    arms_epoch(arm_chosen)= arms_epoch(arm_chosen)+1;
    time(all_epoch) = runtimes;
    temp = [goldanswer_history(arm_chosen,goldaccept_history(arm_chosen,:)==1) ggold(arm_chosen)];
    if length(temp)>1
        goldvariance_history(i) = sum((temp-mean(temp)).^2)/(length(temp)-1);
    else
        goldvariance_history(i) = 1/4;
    end
    length_current_epoch = runtimes - time(all_epoch-1)-number_arms;
    accept = rand(length_current_epoch,1)<arms_interest(arm_chosen);
    answers = rand(length_current_epoch,1)<arms_reliability(arm_chosen);
    reward(all_epoch+1) = reward(all_epoch) + sum(answers((accept==1))-bbeta*goldvariance_history(i)/length(temp));
    regret(all_epoch) = max(arms_product)*time(all_epoch)-reward(all_epoch+1);
else
    time(all_epoch) = runtimes;
    reward(all_epoch+1) = reward(all_epoch);
    regret(all_epoch) = regret(all_epoch-1);
end


save(['.\common_setting\URC_' name num2str(ith) '.mat']);
end
