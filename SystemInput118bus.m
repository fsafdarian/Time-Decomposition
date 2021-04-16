% Read generators data
GenData = xlsread('InputData118',1);
% Read branch data
BranchData = xlsread('InputData118',2);
% Read load distribution data
LoadDist = xlsread('InputData118',3);
% Read hourly load data
HourlyLoad = xlsread('InputData118',4);
% Number of buses
Nbus = 118;
% Number of units
Nunits = 54;
% Reference bus
ReferenceBus = 69;
% Limit of power provided by generating units
Pmin = GenData(1:Nunits,7);
Pmax = GenData(1:Nunits,6);
% Cost curve of generating units
CostCurve(:,1) = GenData(:,2).*GenData(:,3);
CostCurve(:,2) = GenData(:,2).*GenData(:,4);
CostCurve(:,3) = GenData(:,2).*GenData(:,5);
C = CostCurve(1:Nunits,1)';
B = CostCurve(1:Nunits,2)';
A = diag(CostCurve(1:Nunits,3));
% Generator Ramping up and down
RU = GenData(:,10);
RD = GenData(:,11);
% Branch data
Nbranch = size(BranchData,1);
% Build Kd matrix 
LoadBusIndicator = LoadDist(:,1);
Kd = zeros(Nbus,1);
NumLoadOnBus = zeros(Nbus,1);
for j = 1: size(LoadBusIndicator,1)
    Kd(LoadBusIndicator(j),1) = 1;
    NumLoadOnBus(LoadBusIndicator(j),1) = NumLoadOnBus(LoadBusIndicator(j),1) + 1;
end
% Build Kp matrix 
GenBusIndicator = GenData(:,1);
KpIndicator = zeros(Nbus,1);
NumGenOnBus = zeros(Nbus,1);
for j = 1: size(GenBusIndicator,1)
    KpIndicator(GenBusIndicator(j),1) = 1;
    NumGenOnBus(GenBusIndicator(j),1) = NumGenOnBus(GenBusIndicator(j),1) + 1;
end
Kp = diag(KpIndicator);
% Build Kl matrix 
Kl = zeros(Nbus,Nbranch);
for j = 1:Nbranch
    Kl(BranchData(j,1),j) = 1;
    Kl(BranchData(j,2),j) = -1;
end

% Hourly load over 24-h horizon
Pforecast = HourlyLoad(:,2);
% Distribute the hourly load among the loads
LoadDistribution = LoadDist(:,2);
D = zeros(Nbus,Horizon);
for h = 1:Horizon                                                           % Load distribution on the buses
    for j = 1:size(LoadBusIndicator,1)
        D(LoadBusIndicator(j),h) = D(LoadBusIndicator(j),h) + LoadDistribution(j)*Pforecast(h)/sum(LoadDistribution);
    end
end