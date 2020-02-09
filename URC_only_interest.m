function URC_only_interest(loadpath, savepath, ith)
load(loadpath);

arms_product = arms_interest.*arms_reliability;

Xave = zeros(number_arms,1); %average X, length number_arms
arms_epoch = zeros(number_arms,1);

chosenarms_history = 1:number_arms; %indicate the arm chosen in the epoches
goldaccept_history = zeros(number_arms,1); %indicate the gold one is accept(1) or not(0)
goldanswer_history = zeros(number_arms,1); %only applicable when goldaccept_history is 1(accept)

reward = zeros(1,1);
regret = zeros(1,1);



%start
i = 1;
goldaccept_history(:,1) = double(rand(number_arms,1)<(arms_interest'));
goldanswer_history(:,1) = double(rand(number_arms,1)<(arms_reliability'));
%%Xave = (goldaccept_history(:,1).* goldanswer_history(:,1));
Xave = (goldaccept_history(:,1));

time(1) = number_arms;
reward(1) = 0;
regret(1) = max(arms_product)*number_arms;
goldaccept_history = goldaccept_history+1;
i = 2;


%main part
while 1
    [~,arm_chosen] = max(Xave,[],1);
    goldaccept = rand(number_arms,1)<(arms_interest');
    goldanswer = rand(number_arms,1)<(arms_reliability');
    %%%%Xave = (Xave*(i-1)+goldaccept.* goldanswer)./i;
    Xave = (Xave*(i-1)+goldaccept)./i;
    
    %[~,arm_chosen] = max(Xave,[],1);
    chosenarms_history(end+1) = arm_chosen;
    arms_epoch(arm_chosen)= arms_epoch(arm_chosen)+1;
    time(i) = number_arms*i + ceil(tau(i,2))-ceil(tau(1,2));
    goldaccept_history = goldaccept_history +goldaccept;
    temp = goldaccept_history(arm_chosen);
    if time(i)<runtimes
        %temp = sum(goldaccept_history(arm_chosen,:)) +1;
        
        length_current_epoch = time(i)-time(i-1)-number_arms;
        %         accept = rand(length_current_epoch,1)<arms_interest(arm_chosen);
        %         answers = rand(length_current_epoch,1)<arms_reliability(arm_chosen);
        %         reward(i) = reward(i-1) + sum(answers((accept==1))-bbeta*variances(arm_chosen)/temp);
        %         regret(i) = max(arms_product)*time(i)-reward(i);
        reward(end+1) = reward(end)+ ...
            length_current_epoch*arms_interest(arm_chosen)*(arms_reliability(arm_chosen)-bbeta*variances(arm_chosen)/temp);
        regret(end+1) = max(arms_product)*time(i)-reward(end);
        i = i+1;
    elseif time(i)>=runtimes && time(i-1)+number_arms<runtimes
        time(i) = runtimes;
        %temp = [goldanswer_history(arm_chosen,goldaccept_history(arm_chosen,:)==1) ggold(arm_chosen)];
        
        length_current_epoch = runtimes - time(i-1)-number_arms;
%         accept = rand(length_current_epoch,1)<arms_interest(arm_chosen);
%         answers = rand(length_current_epoch,1)<arms_reliability(arm_chosen);
%         reward(i) = reward(i-1) + sum(answers((accept==1))-bbeta*variances(arm_chosen)/temp);
%         regret(i) = max(arms_product)*time(i)-reward(i);
        reward(end+1) = reward(end)+ ...
            length_current_epoch*arms_interest(arm_chosen)*(arms_reliability(arm_chosen)-bbeta*variances(arm_chosen)/temp);
        regret(end+1) = max(arms_product)*time(i)-reward(end);
        break;
    else
        time(i) = runtimes;
        reward(i) = reward(i-1);
        regret(i) = max(arms_product)*time(i)-reward(i);
        break
    end
end

mkdir([savepath '\URC\']);
save([savepath '\URC\' num2str(ith) '.mat']);
end

