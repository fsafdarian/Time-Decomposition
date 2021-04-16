addpath (genpath('C:\Users\fsafda1\Desktop\YALMIP-master'))
addpath (genpath('C:\gurobi903\win64\matlab'))
clear classes

clear all
clc

%% Control variables of the code
% Time horizon
Horizon = 7*24;
% Ramping constraints (0 is relax, 1 is not relax)
RampingConstraints = 1;

%% Read system input
run SystemInput118bus

tic
%% Define problem variables
P = sdpvar(Nunits,Horizon);
Del = sdpvar(Nbus,Horizon);
KpGen = sdpvar(Nbus,Horizon);

%% Constraints
Constraints = [];

k = 0;
for j = 1:Nbus
    if KpIndicator(j) == 1
        k = k + 1;
    end
end

for h = 1:Horizon
    % upper/lower band of units
    Constraints = [Constraints, Pmin <= P(1:Nunits,h) <= Pmax];
    
    % total power balance
    Constraints = [Constraints, sum(P(1:Nunits,h)) >= Pforecast(h)];

    
    % line flow
    PLine(1:Nbranch,h) = 100*(Del(BranchData(1:Nbranch,1),h)-Del(BranchData(1:Nbranch,2),h))./(BranchData(1:Nbranch,3));
    
    % nodal power balance
    Constraints = [Constraints, Kl*PLine(:,h) == Kp*KpGen(:,h) - Kd.*D(:,h)];
   
    % line flow limits
    Constraints = [Constraints, -BranchData(1:Nbranch,4) <= PLine(1:Nbranch,h) <= BranchData(1:Nbranch,4) ];
    
    % angle of reference bus = 0
    Constraints = [Constraints, Del(ReferenceBus,h) == 0];
end

%% Ramping constraints
if RampingConstraints == 1
    for h = 2:Horizon
        Constraints = [Constraints, P(1:Nunits,h) - P(1:Nunits,h-1) <= RU];
        Constraints = [Constraints, P(1:Nunits,h-1) - P(1:Nunits,h) <= RD];
    end
end

%% Building objective function

Objective = 0;
for h = 1:Horizon
    Objective = Objective + P(1:Nunits,h)'*A*P(1:Nunits,h) + B*P(1:Nunits,h) + sum(C);
    
end

%% Solve the Optimization Problem
Solution = solvesdp(Constraints,Objective)
P = double(P(1:Nunits,1:Horizon));
TotalCost_cent = double(Objective)
CplexTime_cent = Solution.solvertime
TotalTime = toc
beep
