%% K-Means_Clustering_Algorithm_to_Determine_the_Location_of_Stations 
clc
clear all

%% Demand_Mapping
load Data.mat
Long = transpose(Data.Longitude);
Lat = transpose(Data.Latitude);
Loc = [];
Loc(1,:) = Long(1,:);
Loc(2,:) = Lat(1,:);
Location = transpose(Loc);
cluster = 18;

%% Clustering
[idx,C] = kmeans(Location,cluster,'MaxIter',1000,'Replicates',100);

%% Silhouette_Method
Si_Value = silhouette(Location,idx);
Avg_Si = mean(Si_Value);

%% Haversine_Equation
for i=1:1:cluster
    
    for j=1:1:cluster
       
        a = (sin((C(i,2)*(pi/180) - C(j,2)*(pi/180))/2))^2 + cos(C(i,2)*(pi/180))*cos(C(j,2)*(pi/180))*(sin((C(i,1)*(pi/180) - C(j,1)*(pi/180))/2))^2;
        b = 2*atan2(sqrt(a),sqrt(1-a));
        Distance(i,j) = 6371*b;
        
    end
    
end
Imp_Miss = size(Distance(0 < Distance & Distance < 10),1); %Number of Impossible Missions Which are Missions Between Stations Less Than 10km Far from Each Other Also Greater Than 0km Because The Algorithm Calculates Distance Between a Station and Itself
Imp_Miss2 = size(Distance(89 < Distance & Distance < 1000),1);
Max_Distance = max(Distance,[],'all')*1000;
%% Plots
figure('Name','Demand Distribution')
plot(Location(:,1),Location(:,2),'o')
title('\it Demand Distribution')
xlabel('\it Longitude')
ylabel('\it Latitude')
grid on

figure('Name','Stations Location');
for i=1:1:cluster
    
    hold on
    plot(Location(idx==i,1),Location(idx==i,2),'O')
    
end
hold on
plot(C(:,1),C(:,2),'ks','MarkerSize',12,'LineWidth',1) 
legend('Cluster 1','Cluster 2','Cluster 3','Cluster 4','Cluster 5','Cluster 6','Cluster 7','Cluster 8','Cluster 9','Cluster 10','Cluster 11','Cluster 12','Cluster 13','Cluster 14','Cluster 15','Cluster 16','Cluster 17','Cluster 18','Cluster 19','Cluster 20','Cluster 21','Cluster 22','Cluster 23','Cluster 24','Cluster 25','Cluster 26','Cluster 27','Cluster 28','Cluster 29','Cluster 30','Cluster 31','Cluster 32','Cluster 33','Cluster 34','Cluster 35','Cluster 36','Cluster 37','Cluster 38','Cluster 39','Cluster 40','Cluster 41','Cluster 42','Centroids','Location','NE','NumColumns',2)
title('\it Stations Location')
xlabel('\it Longitude')
ylabel('\it Latitude')
grid on

figure('Name','Silhouette Method');
silhouette(Location,idx)
title('\it Silhouette Method')

%% Display
fprintf('The Location of Stations is \n')
disp(C)
fprintf('Average Silhouette Value is \n')
disp(Avg_Si)
fprintf('Number of Impossible Missions is \n')
disp(Imp_Miss)
fprintf('Maximum Stations Distance is \n')
disp(Max_Distance)

xlswrite('42_Stations.xlsx',[C(:,1),C(:,2)])