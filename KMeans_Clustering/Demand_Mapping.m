%% Demand_Mapping 
clc
clear all

%% Demand_Mapping
load Demand_Distribution.mat

Long = transpose(DemandDistribution.Longitude);
Lat = transpose(DemandDistribution.Latitude);
Dem = transpose(DemandDistribution.RoundedNumberofDemand);

a = -10^(-3)*6;
b = 10^(-3)*6;
c = -10^(-3)*6;
d = 10^(-3)*6;
G = {};

for i = 1:1:size(Dem,2)
 
    F = [];
    
    for j = 1:1:Dem(i)
        
       r1 = a + (b-a).*rand(1,1);
       r2 = c + (d-c).*rand(1,1);
       F(1,j) = Long(i) + r1;
       F(2,j) = Lat(i) + r2;
  
    end
    
    G{1,i} = F;
    
end

Data = cell2mat(G);
Datap = transpose(Data);
xlswrite('Data.xlsx',[Datap(:,1),Datap(:,2)]);
%% Plots
plot(Data(1,:),Data(2,:),'o')
title('\it Demand Distribution')
xlabel('\it Longitude')
ylabel('\it Latitude')