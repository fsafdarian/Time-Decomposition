addpath (genpath('C:\Users\fsafda1\Desktop\YALMIP-master'))
% addpath(genpath('C:\Program Files\IBM\ILOG\CPLEX_Studio128\cplex\matlab\x64_win64'))
addpath (genpath('C:\gurobi800\win64\matlab'))


% % clear classes
% 
% clear all
% clc
clearvars -except TotalCost_cent CplexTime_cent 
clc
tic
%% Control variables of the code
% Number of intervls (subproblems)
NumInterval = 7;
% Time horizon
OveralHorizon = 7*24;
% OveralHorizon = 24;
% Ramping constraints (0 is relax, 1 is not relax)
RampingConstraints = 1;
% 0 if no initilization, 1 if with the initilization
Initilization = 1;
% 0 if no contingency, 1 if with n-1 contingency
contingency=0;
%% Read system input
run SystemInput118bus

r=zeros(Nunits,NumInterval-1);
t=zeros(Nunits,NumInterval-1);
Coef1 = 0.2;
Coef2 = 1;
m=Coef1*ones(Nunits,NumInterval-1);
g=Coef2*ones(Nunits,NumInterval-1);
if Initilization == 1
    run InitilizationStep
else
    for iiii=1:NumInterval-1
        r(:,iiii)= Pmax;
        t(:,iiii)= Pmin;
    end
    
end



ro = Coef1*ones(1*Nunits,1);  % this is indeed ro/2 since ro is used in the penalty function
gama = Coef1*ones(1*Nunits,1);

%     TotalCost_ini = Objective_ini1 + Objective_ini2 + Objective_ini3 +Objective_ini4 + Objective_ini5 + Objective_ini6+ Objective_ini7
%     error_ini=abs(TotalCost_ini - 1.109801212858162e+07)/1.109801212858162e+07

%% Model distributed optimization
ST_cr = 1;
NumIter = 0;      % Loop index

while ST_cr ~= 0
    NumIter = NumIter+1;
    Cost_matrix=zeros(NumInterval,1,NumIter);
    
    for NS = 1:NumInterval     %NS defines the subsystem number
        if NS < NumInterval
            Horizon = (OveralHorizon/NumInterval)+1;
            clear D Pforecast
            D = DTotal(:,1+(NS-1)*(Horizon-1):1+(NS)*(Horizon-1));
            Pforecast = PforecastTotal(1+(NS-1)*(Horizon-1):1+(NS)*(Horizon-1));
        else
            Horizon = (OveralHorizon/NumInterval);
            clear D Pforecast
            D = DTotal(:,1+(NS-1)*(Horizon):OveralHorizon);
            Pforecast = PforecastTotal(1+(NS-1)*(Horizon):OveralHorizon);
        end
        run SCUCSubproblem118
        
        Objective = 0;
        for h = 1:(OveralHorizon/NumInterval)
            Objective = Objective + P(1:Nunits,h)'*A*P(1:Nunits,h) + B*P(1:Nunits,h) + sum(C);
        end
        
        if NS<NumInterval
            P_val(:,:,NS) = double(P);
        else
            P_val_last(:,:,NumInterval) = double(P);
        end
        Objective_val(NS,NumIter) = double(Objective);
        Cost_matrix(NS,1,NumIter)=Objective_val(NS,NumIter);
        CplexTime(NS,NumIter) = Solution.solvertime;
        
    end
    
    for NS_read=1:NumInterval-1
        if NS_read<NumInterval-1
            r(1:Nunits,NS_read) = [P_val(1:Nunits,(OveralHorizon/NumInterval)+1,NS_read)];
            R(1:Nunits,NumIter,NS_read) = [P_val(1:Nunits,(OveralHorizon/NumInterval)+1,NS_read)];
            
            t(1:Nunits,NS_read) = [P_val(1:Nunits,1,NS_read+1)];
            T(1:Nunits,NumIter,NS_read) = [P_val(1:Nunits,1,NS_read+1)];
        else
            r(1:Nunits,NS_read) = [P_val(1:Nunits,(OveralHorizon/NumInterval)+1,NS_read)];
            R(1:Nunits,NumIter,NS_read) = [P_val(1:Nunits,(OveralHorizon/NumInterval)+1,NS_read)];
            t(1:Nunits,NS_read) = [P_val_last(1:Nunits,1,NS_read+1)];
            T(1:Nunits,NumIter,NS_read) = [P_val_last(1:Nunits,1,NS_read+1)];
        end
    end
    

    ST_cr=0;

for S=1:NumInterval-1
    if mod(S,2)==1
        for k = 1:Nunits
            g(k,S) = g(k,S) + m(k,S)*(-t(k,S)+r(k,S));
        end
    elseif mod(S,2)==0
        for k = 1:Nunits
            g(k,S) = g(k,S) + m(k,S)*(t(k,S)-r(k,S));
        end
    end
end

    for NS_stop=1:NumInterval-1
        for k = 1:Nunits
            if abs(t(k,NS_stop)-r(k,NS_stop)) > 0.5
                ST_cr = ST_cr + 1;
            end
        end
    end
    
    
    TotalCost(NumIter) = sum(Cost_matrix(1:NS,1,NumIter))
    error(NumIter)=abs(TotalCost(NumIter) -TotalCost_cent)/TotalCost_cent
    
    
    if NumIter >=10
        break
    end
    
end

beep
%clc
NumIter


for J = 1:NumIter
    TotalTimeSubproblem(J) = max(CplexTime(1:NumInterval,J));
    
end
if Initilization == 1;
    TotalTime = sum(TotalTimeSubproblem)+max(CplexTime_Initialization)
else
    TotalTime = sum(TotalTimeSubproblem)
end
WallTime = toc
beep


