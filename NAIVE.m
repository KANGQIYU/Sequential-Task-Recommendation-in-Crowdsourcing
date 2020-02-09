function NAIVE(loadpath, savepath, ith)
load(loadpath);
% random choose one gold arm every 20 questions
% unlike in UCBC and URC, arm_chosen in this file is random_select. Arm_sel is the the arm for common questions.

% number_arms = 10;
% arms_reliability
% arms_interest
% runtimes =  100000;
epsilon = floor(316/number_arms);
%epsilon = ceil(100/number_arms);
arms_product = arms_interest.*arms_reliability;

Xave = zeros(number_arms,1); 
time = 0;

%before game
%ggold = rand(number_arms,1)<arms_reliability';


%start
i = 1;
goldaccept= double(rand(number_arms,epsilon)<(repmat(arms_interest,epsilon,1)'));
goldanswer = double(rand(number_arms,epsilon)<(repmat(arms_reliability,epsilon,1)'));
Xave = sum(goldaccept.* goldanswer,2)/epsilon;
goldaccept_history = sum(goldaccept,2)+1;
time(1) = number_arms*epsilon;
reward(1) = 0;
regret(1) = max(arms_product)*time(1);
[~,arm_chosen] = max(Xave,[],1);
%main part


temp = goldaccept_history(arm_chosen);
time(2) = runtimes;
length_current_epoch = time(2) - time(1);

%reward(2) = reward(1) + sum(answers((accept==1))-bbeta*variances(arm_chosen)/temp);
reward(2) = reward(1)+ ...
            length_current_epoch*arms_interest(arm_chosen)*(arms_reliability(arm_chosen)-bbeta*0.21/temp);
regret(2) = max(arms_product)*time(2)-reward(end);
%regret(2) = max(arms_product)*time(2) - reward(2)+10;







mkdir([savepath '\NAIVE\']);
save([savepath '\NAIVE\' num2str(ith) '.mat']);
end
