%% Impossible Missions_in_Each_Network
clc
clear all

%% Demand_Mapping
load 16_Stations.mat
Long = transpose(Stations3.Longitude);
Lat = transpose(Stations3.Latitude);
Loc = [];
Loc(1,:) = Long(1,:);
Loc(2,:) = Lat(1,:);
Location = transpose(Loc);

%% Haversine_Equation
for i=1:1:size(Location,1)
    
    for j=1:1:size(Location,1)
       
        a = (sin((Location(i,2)*(pi/180) - Location(j,2)*(pi/180))/2))^2 + cos(Location(i,2)*(pi/180))*cos(Location(j,2)*(pi/180))*(sin((Location(i,1)*(pi/180) - Location(j,1)*(pi/180))/2))^2;
        b = 2*atan2(sqrt(a),sqrt(1-a));
        Distance(i,j) = 6371*b;
        
    end
    
end
Imp_Miss = size(Distance(0 < Distance & Distance < 10),1); %Number of Impossible Missions Which are Missions Between Stations Less Than 10km Far from Each Other Also Greater Than 0km Because The Algorithm Calculates Distance Between a Station and Itself
Imp_Miss2 = size(Distance(89 < Distance & Distance < 1000),1);
Max_Distance = round(max(Distance,[],'all'));
Min_Distance = round(min(nonzeros(Distance),[],'all'));
Mean_Distance = round(mean(nonzeros(triu(Distance))));

Maximum_Number_of_Vertiports_Higher = [];
for i = 1:size(Distance,1)
 
   Maximum_Number_of_Vertiports_Higher(i,:) = Distance(i,:)>=53;
    
end

Maximum_Number_of_Vertiports_Lower = [];
for i = 1:size(Distance,1)
 
   Maximum_Number_of_Vertiports_Lower(i,:) = Distance(i,:)>=58;
    
end
% Maximum_Number_of_Vertiports_Higher = numel(Distance(Distance>=53));
% Maximum_Number_of_Vertiports_Lower = numel(Distance(Distance>=58));

