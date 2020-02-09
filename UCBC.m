function UCBC(loadpath, savepath, ith)
load(loadpath);
% number_arms = 10;
% arms_reliability
% arms_interest
% runtimes =  100000;
rho = 2.1;
arms_product = arms_interest.*arms_reliability;
all_epoch = number_arms;
arms_epoch = ones(number_arms,1);
ubcterm = zeros(number_arms,1);
Xave = zeros(number_arms,1); %average X, length number_arms
% accept = zeros(runtimes,1);
% correct = zeros(runtimes,1);
% recommendation = zeros(runtimes,1);
chosenarms_history = zeros(number_arms,1); %indicate the arm chosen in the epoches
goldaccept_history = zeros(number_arms,1); %indicate the gold one is accept(1) or not(0)
goldanswer_history = zeros(number_arms,1); %only applicable when goldaccept_history is 1(accept)
%goldvariance_history = zeros(number_arms,1);
reward = zeros(number_arms,1);
regret = max(arms_product)*[1:number_arms]';
fruntimes = number_arms;
pruntimes = number_arms;
time = 0;

%before game
ggold = rand(number_arms,1)<arms_reliability';

%start
temp1 = rand(number_arms,1)<arms_interest';
temp2 = rand(number_arms,1)<arms_reliability';
for i = 1:number_arms
    chosenarms_history(i) = i;
    goldaccept_history(i) = temp1(i);
    goldanswer_history(i) = temp2(i);
end

Xave = temp1.*temp2;
time = 1:number_arms;


%main part
while 1
    
    
    [~,arm_chosen] = max(ubcterm,[],1);
    length_current_epoch = ceil(tau(arms_epoch(arm_chosen)+1,1))-ceil(tau(arms_epoch(arm_chosen),1));
    arms_epoch(arm_chosen) = arms_epoch(arm_chosen)+1;
    all_epoch = all_epoch+1;
    if length_current_epoch > 0
        chosenarms_history(end+1) = arm_chosen;
        temp1 = rand(1)<arms_interest(arm_chosen);
        temp2 = rand(1)<arms_reliability(arm_chosen);
        goldaccept_history(end+1) = temp1;
        goldanswer_history(end+1) = temp2;
        tt = (chosenarms_history==arm_chosen);
        goldanswer = goldanswer_history(tt);
        temp = [goldanswer(goldaccept_history(tt)==1);ggold(arm_chosen)];

        pruntimes = fruntimes;
        fruntimes = fruntimes+length_current_epoch;
        if fruntimes<=runtimes
            accept = rand(length_current_epoch-1,1)<arms_interest(arm_chosen);
            answers = rand(length_current_epoch-1,1)<arms_reliability(arm_chosen);
            reward(end+1) = reward(end) + sum(answers((accept==1))-bbeta*variances(arm_chosen)/length(temp));
            regret(end+1) = max(arms_product)*fruntimes-reward(end);
            time(end+1) = fruntimes;
            Xave(arm_chosen) = (Xave(arm_chosen)*(arms_epoch(arm_chosen)-1)+temp1*temp2)/(arms_epoch(arm_chosen));%????not correct
            %
            %
            ubcterm = Xave+sqrt(rho*log(all_epoch)./arms_epoch);
        else
            accept = rand(runtimes-pruntimes-1,1)<arms_interest(arm_chosen);
            answers = rand(runtimes-pruntimes-1,1)<arms_reliability(arm_chosen);
            reward(end+1) = reward(end) + sum(answers((accept==1))-bbeta*variances(arm_chosen)/length(temp));
            regret(end+1) = max(arms_product)*runtimes-reward(end);
            %arms_epoch(arm_chosen) = arms_epoch(arm_chosen)+1;
            %all_epoch = all_epoch+1;
            time(end+1) = runtimes;
            break
        end
    end
    
    
end



mkdir([savepath '\UCBC\']);
save([savepath '\UCBC\' num2str(ith) '.mat']);
end