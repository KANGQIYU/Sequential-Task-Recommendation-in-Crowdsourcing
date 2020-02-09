function NAIVE(loadpath, savepath, ith)
load(loadpath);
% random choose one gold arm every 20 questions
% unlike in UCBC and URC, arm_chosen in this file is random_select. Arm_sel is the the arm for common questions.

% number_arms = 10;
% arms_reliability
% arms_interest
% runtimes =  100000;
length_current_epoch = 50;
arms_product = arms_interest.*arms_reliability;
all_epoch = number_arms;
arms_epoch = ones(number_arms,1);

Xave = zeros(number_arms,1); %average X, length number_arms
%chosenarms_history = zeros(number_arms,1); %indicate the arm chosen in the epoches

arm_sel_his = zeros(number_arms,1);
goldaccept_history = zeros(number_arms,1); %indicate the gold one is accept(1) or not(0)
goldanswer_history = zeros(number_arms,1); %only applicable when goldaccept_history is 1(accept)
%variances = zeros(1,1);

fruntimes = number_arms;
pruntimes = number_arms;
time = 0;

%before game
%ggold = rand(number_arms,1)<arms_reliability';


%start
i = 1;
goldaccept_history = double(rand(number_arms,1)<(arms_interest'));
goldanswer_history = double(rand(number_arms,1)<(arms_reliability'));
Xave = (goldaccept_history.* goldanswer_history);
time(1) = number_arms;
reward(1) = 0;
regret(1) = max(arms_product)*number_arms;
i = 2;

%main part
while 1
   arm_sele = randi(number_arms);
   
   temp1 = rand(1)<arms_interest(arm_sele);
   temp2 = rand(1)<arms_reliability(arm_sele);
   goldaccept_history(arm_sele) = goldaccept_history(arm_sele)+temp1;
   %goldanswer_history(end+1) = temp2;
   %chosenarms_history(end+1) = arm_chosen;
   
   Xave(arm_sele) = (Xave(arm_sele)*arms_epoch(arm_sele)+temp1*temp2)/(arms_epoch(arm_sele)+1); 
   arms_epoch(arm_sele) = arms_epoch(arm_sele)+1;
   
   
   [~,arm_chosen] = max(Xave,[],1);
   arm_sel_his(arm_chosen) = arm_sel_his(arm_chosen)+1;
   temp = goldaccept_history(arm_chosen)+1;
   
   
   pruntimes = fruntimes;
   fruntimes = fruntimes+length_current_epoch;
   if fruntimes<=runtimes
       accept = rand(length_current_epoch-1,1)<arms_interest(arm_chosen);
       answers = rand(length_current_epoch-1,1)<arms_reliability(arm_chosen);
       try
            reward(end+1) = reward(end) + sum(answers((accept==1))-bbeta*variances(arm_chosen)/temp);
       catch
           disp('fuck');
       end
       %disp(length());
       regret(end+1) = max(arms_product)*fruntimes-reward(end);
       time(end+1) = fruntimes;
   else
       accept = rand(runtimes-pruntimes-1,1)<arms_interest(arm_chosen);
       answers = rand(runtimes-pruntimes-1,1)<arms_reliability(arm_chosen);
       reward(end+1) = reward(end) + sum(answers((accept==1))-bbeta*variances(arm_chosen)/temp);
       regret(end+1) = max(arms_product)*runtimes-reward(end);
       time(end+1) = runtimes;
       break
   end
   

end




mkdir([savepath '\NAIVE\']);
save([savepath '\NAIVE\' num2str(ith) '.mat']);
end
