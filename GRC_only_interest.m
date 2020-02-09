function GRC_only_interest(loadpath, savepath, ith)
load(loadpath);

global C;

arms_product = arms_interest.*arms_reliability;
arms_productsort = sort(arms_product); %ascending
d = arms_productsort(end) - arms_productsort(end-1);

Xave = zeros(number_arms,1); %average X, length number_arms
arms_epoch = ones(number_arms,1);

chosenarms_history = 1:number_arms; %indicate the arm chosen in the epoches
goldaccept_history = zeros(number_arms,1); %indicate the gold one is accept(1) or not(0)
goldanswer_history = zeros(number_arms,1); %only applicable when goldaccept_history is 1(accept)

reward = [];
regret = [];
time = zeros(1,number_arms);

%before game
%ggold = rand(number_arms,1)<arms_reliability';


%start
i = 1;
goldaccept_history = double(rand(number_arms,1)<(arms_interest'));
goldanswer_history = double(rand(number_arms,1)<(arms_reliability'));
%%% Xave = (goldaccept_history.* goldanswer_history);
Xave = (goldaccept_history);

time = 1:number_arms;
reward = 0*ones(1,number_arms);
regret = max(arms_product)*(1:number_arms);
goldaccept_history = goldaccept_history+1;
i = number_arms+1;

%main part
while 1 
    epsilon = min(1,C*number_arms/(d^2*i));
    [~,arm_chosen] = max(Xave,[],1);
    if rand(1) < epsilon
        arm_chosen = randi(number_arms);
    end
    chosenarms_history(end+1) = arm_chosen;
    
    time(i) = ceil(tau(i,3))+i-ceil(tau(number_arms,3));
    temp1 = rand(1)<arms_interest(arm_chosen);
    temp2 = rand(1)<arms_reliability(arm_chosen);
    goldaccept_history(arm_chosen) = goldaccept_history(arm_chosen)+temp1; 
    %goldanswer_history(arm_chosen) = temp2;
    temp = goldaccept_history(arm_chosen);
    if time(i)<runtimes
        length_current_epoch = time(i)-time(i-1)-1; 
        %accept = rand(length_current_epoch,1)<arms_interest(arm_chosen);
        %answers = rand(length_current_epoch,1)<arms_reliability(arm_chosen); 
        %reward(end+1) = reward(end) + sum(answers((accept==1))-bbeta*variances(arm_chosen)/temp);
        reward(end+1) = reward(end)+ ...
            length_current_epoch*arms_interest(arm_chosen)*(arms_reliability(arm_chosen)-bbeta*variances(arm_chosen)/temp);
        regret(end+1) = max(arms_product)*time(i)-reward(end);
        %%%Xave(arm_chosen) = (Xave(arm_chosen)*arms_epoch(arm_chosen)+temp1*temp2)/(arms_epoch(arm_chosen)+1);
        
        Xave(arm_chosen) = (Xave(arm_chosen)*arms_epoch(arm_chosen)+temp1)/(arms_epoch(arm_chosen)+1);
        
        
        
        arms_epoch(arm_chosen)= arms_epoch(arm_chosen)+1;
        i = i+1;
    elseif time(i)>=runtimes
        time(i) = runtimes;
        length_current_epoch = runtimes - time(i-1);
%         accept = rand(length_current_epoch,1)<arms_interest(arm_chosen);
%         answers = rand(length_current_epoch,1)<arms_reliability(arm_chosen);
%         reward(end+1) = reward(end) + sum(answers((accept==1))-bbeta*variances(arm_chosen)/temp);
        reward(end+1) = reward(end)+ ...
            length_current_epoch*arms_interest(arm_chosen)*(arms_reliability(arm_chosen)-bbeta*variances(arm_chosen)/temp);
        regret(end+1) = max(arms_product)*time(i)-reward(end);
        break;
    end
    
end

mkdir([savepath '\GRC\']);
save([savepath '\GRC\' num2str(ith) '.mat']);
end

