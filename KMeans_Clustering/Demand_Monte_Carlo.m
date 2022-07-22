%% Demand Monte Carlo
clc
clear all


load Demand_Distribution.mat

Long = transpose(DemandDistribution.Longitude);
Lat = transpose(DemandDistribution.Latitude);
Dem_Original = transpose(DemandDistribution.RoundedNumberofDemand);

%% Monte Carlo 10% Deviation
Number_of_Simulations = 1000;
Distance_Between_Stations410 = [];
Distance_Between_Stations810 = [];
Distance_Between_Stations1210 = [];
Distance_Between_Stations1610 = [];
Distance_Between_Stations420 = [];
Distance_Between_Stations820 = [];
Distance_Between_Stations1220 = [];
Distance_Between_Stations1620 = [];
Distance_Between_Stations430 = [];
Distance_Between_Stations830 = [];
Distance_Between_Stations1230 = [];
Distance_Between_Stations1630 = [];
Distance_Between_Stations440 = [];
Distance_Between_Stations840 = [];
Distance_Between_Stations1240 = [];
Distance_Between_Stations1640 = [];
Distance_Between_Stations450 = [];
Distance_Between_Stations850 = [];
Distance_Between_Stations1250 = [];
Distance_Between_Stations1650 = [];
Distance_Between_Stations460 = [];
Distance_Between_Stations860 = [];
Distance_Between_Stations1260 = [];
Distance_Between_Stations1660 = [];
Distance_Between_Stations470 = [];
Distance_Between_Stations870 = [];
Distance_Between_Stations1270 = [];
Distance_Between_Stations1670 = [];
Distance_Between_Stations480 = [];
Distance_Between_Stations880 = [];
Distance_Between_Stations1280 = [];
Distance_Between_Stations1680 = [];
Distance_Between_Stations490 = [];
Distance_Between_Stations890 = [];
Distance_Between_Stations1290 = [];
Distance_Between_Stations1690 = [];
Distance_Between_Stations4100 = [];
Distance_Between_Stations8100 = [];
Distance_Between_Stations12100 = [];
Distance_Between_Stations16100 = [];
Error = [-0.1 0.1];

for g = 1:1:Number_of_Simulations
    
    
    for k = 1:1:size(Dem_Original,2)
   
        Dem_Deviated(1,k) = Dem_Original(1,k) + Error(1,randi([1,2]))*Dem_Original(1,k);
    
    end

    G_Original = {}; % Original Demand Distribution Data
    G_Deviated = {}; % Deviated Demand Distribution Data

    for i = 1:1:size(Dem_Original,2)
 
        F_Original = [];
    
        for j = 1:1:Dem_Original(i)
        
            F_Original(1,j) = Long(i);
            F_Original(2,j) = Lat(i);
  
        end
    
        F_Deviated = [];
    
        for n = 1:1:Dem_Deviated(i)
        
           F_Deviated(1,n) = Long(i);
           F_Deviated(2,n) = Lat(i);

        end
    
        G_Original{1,i} = F_Original;
        G_Deviated{1,i} = F_Deviated;
    
    end

    Data_Original = cell2mat(G_Original);
    Location_Original = transpose(Data_Original);
    Data_Deviated = cell2mat(G_Deviated);
    Location_Deviated = transpose(Data_Deviated);

    %% Clustering
    cluster = 4;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance410(i,h) = 6371*b*1000;
        
        end
        Distances410(i,1) = min(Distance410(i,:));
    end
    
    Distance_Between_Stations410 = [Distance_Between_Stations410 Distances410];
    Average_Distance_Between_Stations410 = mean(Distance_Between_Stations410,'all');
    
    %% Clustering
    cluster = 8;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance810(i,h) = 6371*b*1000;
        
        end
        Distances810(i,1) = min(Distance810(i,:));
    end
    
    Distance_Between_Stations810 = [Distance_Between_Stations810 Distances810];
    Average_Distance_Between_Stations810 = mean(Distance_Between_Stations810,'all');
    
    %% Clustering
    cluster = 12;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance1210(i,h) = 6371*b*1000;
        
        end
        Distances1210(i,1) = min(Distance1210(i,:));
    end
    
    Distance_Between_Stations1210 = [Distance_Between_Stations1210 Distances1210];
    Average_Distance_Between_Stations1210 = mean(Distance_Between_Stations1210,'all');
    
    %% Clustering
    cluster = 16;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance1610(i,h) = 6371*b*1000;
        
        end
        Distances1610(i,1) = min(Distance1610(i,:));
    end
    
    Distance_Between_Stations1610 = [Distance_Between_Stations1610 Distances1610];
    Average_Distance_Between_Stations1610 = mean(Distance_Between_Stations1610,'all');
    
end

%% Monte Carlo 20% Deviation
Error = [-0.2 0.2];

for g = 1:1:Number_of_Simulations
    
    
    for k = 1:1:size(Dem_Original,2)
   
        Dem_Deviated(1,k) = Dem_Original(1,k) + Error(1,randi([1,2]))*Dem_Original(1,k);
    
    end

    G_Original = {}; % Original Demand Distribution Data
    G_Deviated = {}; % Deviated Demand Distribution Data

    for i = 1:1:size(Dem_Original,2)
 
        F_Original = [];
    
        for j = 1:1:Dem_Original(i)
        
            F_Original(1,j) = Long(i);
            F_Original(2,j) = Lat(i);
  
        end
    
        F_Deviated = [];
    
        for n = 1:1:Dem_Deviated(i)
        
           F_Deviated(1,n) = Long(i);
           F_Deviated(2,n) = Lat(i);

        end
    
        G_Original{1,i} = F_Original;
        G_Deviated{1,i} = F_Deviated;
    
    end

    Data_Original = cell2mat(G_Original);
    Location_Original = transpose(Data_Original);
    Data_Deviated = cell2mat(G_Deviated);
    Location_Deviated = transpose(Data_Deviated);

    %% Clustering
    cluster = 4;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance420(i,h) = 6371*b*1000;
        
        end
        Distances420(i,1) = min(Distance420(i,:));
    end
    
    Distance_Between_Stations420 = [Distance_Between_Stations420 Distances420];
    Average_Distance_Between_Stations420 = mean(Distance_Between_Stations420,'all');
    
    %% Clustering
    cluster = 8;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance820(i,h) = 6371*b*1000;
        
        end
        Distances820(i,1) = min(Distance820(i,:));
    end
    
    Distance_Between_Stations820 = [Distance_Between_Stations820 Distances820];
    Average_Distance_Between_Stations820 = mean(Distance_Between_Stations820,'all');
    
    %% Clustering
    cluster = 12;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance1220(i,h) = 6371*b*1000;
        
        end
        Distances1220(i,1) = min(Distance1220(i,:));
    end
    
    Distance_Between_Stations1220 = [Distance_Between_Stations1220 Distances1220];
    Average_Distance_Between_Stations1220 = mean(Distance_Between_Stations1220,'all');
    
    %% Clustering
    cluster = 16;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance1620(i,h) = 6371*b*1000;
        
        end
        Distances1620(i,1) = min(Distance1620(i,:));
    end
    
    Distance_Between_Stations1620 = [Distance_Between_Stations1620 Distances1620];
    Average_Distance_Between_Stations1620 = mean(Distance_Between_Stations1620,'all');
    
end

%% Monte Carlo 30% Deviation
Error = [-0.3 0.3];

for g = 1:1:Number_of_Simulations
    
    
    for k = 1:1:size(Dem_Original,2)
   
        Dem_Deviated(1,k) = Dem_Original(1,k) + Error(1,randi([1,2]))*Dem_Original(1,k);
    
    end

    G_Original = {}; % Original Demand Distribution Data
    G_Deviated = {}; % Deviated Demand Distribution Data

    for i = 1:1:size(Dem_Original,2)
 
        F_Original = [];
    
        for j = 1:1:Dem_Original(i)
        
            F_Original(1,j) = Long(i);
            F_Original(2,j) = Lat(i);
  
        end
    
        F_Deviated = [];
    
        for n = 1:1:Dem_Deviated(i)
        
           F_Deviated(1,n) = Long(i);
           F_Deviated(2,n) = Lat(i);

        end
    
        G_Original{1,i} = F_Original;
        G_Deviated{1,i} = F_Deviated;
    
    end

    Data_Original = cell2mat(G_Original);
    Location_Original = transpose(Data_Original);
    Data_Deviated = cell2mat(G_Deviated);
    Location_Deviated = transpose(Data_Deviated);

    %% Clustering
    cluster = 4;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance430(i,h) = 6371*b*1000;
        
        end
        Distances430(i,1) = min(Distance430(i,:));
    end
    
    Distance_Between_Stations430 = [Distance_Between_Stations430 Distances430];
    Average_Distance_Between_Stations430 = mean(Distance_Between_Stations430,'all');
    
    %% Clustering
    cluster = 8;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance830(i,h) = 6371*b*1000;
        
        end
        Distances830(i,1) = min(Distance830(i,:));
    end
    
    Distance_Between_Stations830 = [Distance_Between_Stations830 Distances830];
    Average_Distance_Between_Stations830 = mean(Distance_Between_Stations830,'all');
    
    %% Clustering
    cluster = 12;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance1230(i,h) = 6371*b*1000;
        
        end
        Distances1230(i,1) = min(Distance1230(i,:));
    end
    
    Distance_Between_Stations1230 = [Distance_Between_Stations1230 Distances1230];
    Average_Distance_Between_Stations1230 = mean(Distance_Between_Stations1230,'all');
    
    %% Clustering
    cluster = 16;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance1630(i,h) = 6371*b*1000;
        
        end
        Distances1630(i,1) = min(Distance1630(i,:));
    end
    
    Distance_Between_Stations1630 = [Distance_Between_Stations1630 Distances1630];
    Average_Distance_Between_Stations1630 = mean(Distance_Between_Stations1630,'all');
    
end

%% Monte Carlo 40% Deviation
Error = [-0.4 0.4];

for g = 1:1:Number_of_Simulations
    
    
    for k = 1:1:size(Dem_Original,2)
   
        Dem_Deviated(1,k) = Dem_Original(1,k) + Error(1,randi([1,2]))*Dem_Original(1,k);
    
    end

    G_Original = {}; % Original Demand Distribution Data
    G_Deviated = {}; % Deviated Demand Distribution Data

    for i = 1:1:size(Dem_Original,2)
 
        F_Original = [];
    
        for j = 1:1:Dem_Original(i)
        
            F_Original(1,j) = Long(i);
            F_Original(2,j) = Lat(i);
  
        end
    
        F_Deviated = [];
    
        for n = 1:1:Dem_Deviated(i)
        
           F_Deviated(1,n) = Long(i);
           F_Deviated(2,n) = Lat(i);

        end
    
        G_Original{1,i} = F_Original;
        G_Deviated{1,i} = F_Deviated;
    
    end

    Data_Original = cell2mat(G_Original);
    Location_Original = transpose(Data_Original);
    Data_Deviated = cell2mat(G_Deviated);
    Location_Deviated = transpose(Data_Deviated);

    %% Clustering
    cluster = 4;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance440(i,h) = 6371*b*1000;
        
        end
        Distances440(i,1) = min(Distance440(i,:));
    end
    
    Distance_Between_Stations440 = [Distance_Between_Stations440 Distances440];
    Average_Distance_Between_Stations440 = mean(Distance_Between_Stations440,'all');
    
    %% Clustering
    cluster = 8;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance840(i,h) = 6371*b*1000;
        
        end
        Distances840(i,1) = min(Distance840(i,:));
    end
    
    Distance_Between_Stations840 = [Distance_Between_Stations840 Distances840];
    Average_Distance_Between_Stations840 = mean(Distance_Between_Stations840,'all');
    
    %% Clustering
    cluster = 12;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance1240(i,h) = 6371*b*1000;
        
        end
        Distances1240(i,1) = min(Distance1240(i,:));
    end
    
    Distance_Between_Stations1240 = [Distance_Between_Stations1240 Distances1240];
    Average_Distance_Between_Stations1240 = mean(Distance_Between_Stations1240,'all');
    
    %% Clustering
    cluster = 16;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance1640(i,h) = 6371*b*1000;
        
        end
        Distances1640(i,1) = min(Distance1640(i,:));
    end
    
    Distance_Between_Stations1640 = [Distance_Between_Stations1640 Distances1640];
    Average_Distance_Between_Stations1640 = mean(Distance_Between_Stations1640,'all');
    
end

%% Monte Carlo 50% Deviation
Error = [-0.5 0.5];

for g = 1:1:Number_of_Simulations
    
    
    for k = 1:1:size(Dem_Original,2)
   
        Dem_Deviated(1,k) = Dem_Original(1,k) + Error(1,randi([1,2]))*Dem_Original(1,k);
    
    end

    G_Original = {}; % Original Demand Distribution Data
    G_Deviated = {}; % Deviated Demand Distribution Data

    for i = 1:1:size(Dem_Original,2)
 
        F_Original = [];
    
        for j = 1:1:Dem_Original(i)
        
            F_Original(1,j) = Long(i);
            F_Original(2,j) = Lat(i);
  
        end
    
        F_Deviated = [];
    
        for n = 1:1:Dem_Deviated(i)
        
           F_Deviated(1,n) = Long(i);
           F_Deviated(2,n) = Lat(i);

        end
    
        G_Original{1,i} = F_Original;
        G_Deviated{1,i} = F_Deviated;
    
    end

    Data_Original = cell2mat(G_Original);
    Location_Original = transpose(Data_Original);
    Data_Deviated = cell2mat(G_Deviated);
    Location_Deviated = transpose(Data_Deviated);

    %% Clustering
    cluster = 4;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance450(i,h) = 6371*b*1000;
        
        end
        Distances450(i,1) = min(Distance450(i,:));
    end
    
    Distance_Between_Stations450 = [Distance_Between_Stations450 Distances450];
    Average_Distance_Between_Stations450 = mean(Distance_Between_Stations450,'all');
    
    %% Clustering
    cluster = 8;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance850(i,h) = 6371*b*1000;
        
        end
        Distances850(i,1) = min(Distance850(i,:));
    end
    
    Distance_Between_Stations850 = [Distance_Between_Stations850 Distances850];
    Average_Distance_Between_Stations850 = mean(Distance_Between_Stations850,'all');
    
    %% Clustering
    cluster = 12;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance1250(i,h) = 6371*b*1000;
        
        end
        Distances1250(i,1) = min(Distance1250(i,:));
    end
    
    Distance_Between_Stations1250 = [Distance_Between_Stations1250 Distances1250];
    Average_Distance_Between_Stations1250 = mean(Distance_Between_Stations1250,'all');
    
    %% Clustering
    cluster = 16;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance1650(i,h) = 6371*b*1000;
        
        end
        Distances1650(i,1) = min(Distance1650(i,:));
    end
    
    Distance_Between_Stations1650 = [Distance_Between_Stations1650 Distances1650];
    Average_Distance_Between_Stations1650 = mean(Distance_Between_Stations1650,'all');
    
end

%% Monte Carlo 60% Deviation
Error = [-0.6 0.6];

for g = 1:1:Number_of_Simulations
    
    
    for k = 1:1:size(Dem_Original,2)
   
        Dem_Deviated(1,k) = Dem_Original(1,k) + Error(1,randi([1,2]))*Dem_Original(1,k);
    
    end

    G_Original = {}; % Original Demand Distribution Data
    G_Deviated = {}; % Deviated Demand Distribution Data

    for i = 1:1:size(Dem_Original,2)
 
        F_Original = [];
    
        for j = 1:1:Dem_Original(i)
        
            F_Original(1,j) = Long(i);
            F_Original(2,j) = Lat(i);
  
        end
    
        F_Deviated = [];
    
        for n = 1:1:Dem_Deviated(i)
        
           F_Deviated(1,n) = Long(i);
           F_Deviated(2,n) = Lat(i);

        end
    
        G_Original{1,i} = F_Original;
        G_Deviated{1,i} = F_Deviated;
    
    end

    Data_Original = cell2mat(G_Original);
    Location_Original = transpose(Data_Original);
    Data_Deviated = cell2mat(G_Deviated);
    Location_Deviated = transpose(Data_Deviated);

    %% Clustering
    cluster = 4;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance460(i,h) = 6371*b*1000;
        
        end
        Distances460(i,1) = min(Distance460(i,:));
    end
    
    Distance_Between_Stations460 = [Distance_Between_Stations460 Distances460];
    Average_Distance_Between_Stations460 = mean(Distance_Between_Stations460,'all');
    
    %% Clustering
    cluster = 8;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance860(i,h) = 6371*b*1000;
        
        end
        Distances860(i,1) = min(Distance860(i,:));
    end
    
    Distance_Between_Stations860 = [Distance_Between_Stations860 Distances860];
    Average_Distance_Between_Stations860 = mean(Distance_Between_Stations860,'all');
    
    %% Clustering
    cluster = 12;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance1260(i,h) = 6371*b*1000;
        
        end
        Distances1260(i,1) = min(Distance1260(i,:));
    end
    
    Distance_Between_Stations1260 = [Distance_Between_Stations1260 Distances1260];
    Average_Distance_Between_Stations1260 = mean(Distance_Between_Stations1260,'all');
    
    %% Clustering
    cluster = 16;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance1660(i,h) = 6371*b*1000;
        
        end
        Distances1660(i,1) = min(Distance1660(i,:));
    end
    
    Distance_Between_Stations1660 = [Distance_Between_Stations1660 Distances1660];
    Average_Distance_Between_Stations1660 = mean(Distance_Between_Stations1660,'all');
    
end

%% Monte Carlo 70% Deviation
Error = [-0.7 0.7];

for g = 1:1:Number_of_Simulations
    
    
    for k = 1:1:size(Dem_Original,2)
   
        Dem_Deviated(1,k) = Dem_Original(1,k) + Error(1,randi([1,2]))*Dem_Original(1,k);
    
    end

    G_Original = {}; % Original Demand Distribution Data
    G_Deviated = {}; % Deviated Demand Distribution Data

    for i = 1:1:size(Dem_Original,2)
 
        F_Original = [];
    
        for j = 1:1:Dem_Original(i)
        
            F_Original(1,j) = Long(i);
            F_Original(2,j) = Lat(i);
  
        end
    
        F_Deviated = [];
    
        for n = 1:1:Dem_Deviated(i)
        
           F_Deviated(1,n) = Long(i);
           F_Deviated(2,n) = Lat(i);

        end
    
        G_Original{1,i} = F_Original;
        G_Deviated{1,i} = F_Deviated;
    
    end

    Data_Original = cell2mat(G_Original);
    Location_Original = transpose(Data_Original);
    Data_Deviated = cell2mat(G_Deviated);
    Location_Deviated = transpose(Data_Deviated);

    %% Clustering
    cluster = 4;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance470(i,h) = 6371*b*1000;
        
        end
        Distances470(i,1) = min(Distance470(i,:));
    end
    
    Distance_Between_Stations470 = [Distance_Between_Stations470 Distances470];
    Average_Distance_Between_Stations470 = mean(Distance_Between_Stations470,'all');
    
    %% Clustering
    cluster = 8;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance870(i,h) = 6371*b*1000;
        
        end
        Distances870(i,1) = min(Distance870(i,:));
    end
    
    Distance_Between_Stations870 = [Distance_Between_Stations870 Distances870];
    Average_Distance_Between_Stations870 = mean(Distance_Between_Stations870,'all');
    
    %% Clustering
    cluster = 12;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance1270(i,h) = 6371*b*1000;
        
        end
        Distances1270(i,1) = min(Distance1270(i,:));
    end
    
    Distance_Between_Stations1270 = [Distance_Between_Stations1270 Distances1270];
    Average_Distance_Between_Stations1270 = mean(Distance_Between_Stations1270,'all');
    
    %% Clustering
    cluster = 16;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance1670(i,h) = 6371*b*1000;
        
        end
        Distances1670(i,1) = min(Distance1670(i,:));
    end
    
    Distance_Between_Stations1670 = [Distance_Between_Stations1670 Distances1670];
    Average_Distance_Between_Stations1670 = mean(Distance_Between_Stations1670,'all');
    
end

%% Monte Carlo 80% Deviation
Error = [-0.8 0.8];

for g = 1:1:Number_of_Simulations
    
    
    for k = 1:1:size(Dem_Original,2)
   
        Dem_Deviated(1,k) = Dem_Original(1,k) + Error(1,randi([1,2]))*Dem_Original(1,k);
    
    end

    G_Original = {}; % Original Demand Distribution Data
    G_Deviated = {}; % Deviated Demand Distribution Data

    for i = 1:1:size(Dem_Original,2)
 
        F_Original = [];
    
        for j = 1:1:Dem_Original(i)
        
            F_Original(1,j) = Long(i);
            F_Original(2,j) = Lat(i);
  
        end
    
        F_Deviated = [];
    
        for n = 1:1:Dem_Deviated(i)
        
           F_Deviated(1,n) = Long(i);
           F_Deviated(2,n) = Lat(i);

        end
    
        G_Original{1,i} = F_Original;
        G_Deviated{1,i} = F_Deviated;
    
    end

    Data_Original = cell2mat(G_Original);
    Location_Original = transpose(Data_Original);
    Data_Deviated = cell2mat(G_Deviated);
    Location_Deviated = transpose(Data_Deviated);

    %% Clustering
    cluster = 4;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance480(i,h) = 6371*b*1000;
        
        end
        Distances480(i,1) = min(Distance480(i,:));
    end
    
    Distance_Between_Stations480 = [Distance_Between_Stations480 Distances480];
    Average_Distance_Between_Stations480 = mean(Distance_Between_Stations480,'all');
    
    %% Clustering
    cluster = 8;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance880(i,h) = 6371*b*1000;
        
        end
        Distances880(i,1) = min(Distance880(i,:));
    end
    
    Distance_Between_Stations880 = [Distance_Between_Stations880 Distances880];
    Average_Distance_Between_Stations880 = mean(Distance_Between_Stations880,'all');
    
    %% Clustering
    cluster = 12;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance1280(i,h) = 6371*b*1000;
        
        end
        Distances1280(i,1) = min(Distance1280(i,:));
    end
    
    Distance_Between_Stations1280 = [Distance_Between_Stations1280 Distances1280];
    Average_Distance_Between_Stations1280 = mean(Distance_Between_Stations1280,'all');
    
    %% Clustering
    cluster = 16;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance1680(i,h) = 6371*b*1000;
        
        end
        Distances1680(i,1) = min(Distance1680(i,:));
    end
    
    Distance_Between_Stations1680 = [Distance_Between_Stations1680 Distances1680];
    Average_Distance_Between_Stations1680 = mean(Distance_Between_Stations1680,'all');
    
end

%% Monte Carlo 90% Deviation
Error = [-0.9 0.9];

for g = 1:1:Number_of_Simulations
    
    
    for k = 1:1:size(Dem_Original,2)
   
        Dem_Deviated(1,k) = Dem_Original(1,k) + Error(1,randi([1,2]))*Dem_Original(1,k);
    
    end

    G_Original = {}; % Original Demand Distribution Data
    G_Deviated = {}; % Deviated Demand Distribution Data

    for i = 1:1:size(Dem_Original,2)
 
        F_Original = [];
    
        for j = 1:1:Dem_Original(i)
        
            F_Original(1,j) = Long(i);
            F_Original(2,j) = Lat(i);
  
        end
    
        F_Deviated = [];
    
        for n = 1:1:Dem_Deviated(i)
        
           F_Deviated(1,n) = Long(i);
           F_Deviated(2,n) = Lat(i);

        end
    
        G_Original{1,i} = F_Original;
        G_Deviated{1,i} = F_Deviated;
    
    end

    Data_Original = cell2mat(G_Original);
    Location_Original = transpose(Data_Original);
    Data_Deviated = cell2mat(G_Deviated);
    Location_Deviated = transpose(Data_Deviated);

    %% Clustering
    cluster = 4;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance490(i,h) = 6371*b*1000;
        
        end
        Distances490(i,1) = min(Distance490(i,:));
    end
    
    Distance_Between_Stations490 = [Distance_Between_Stations490 Distances490];
    Average_Distance_Between_Stations490 = mean(Distance_Between_Stations490,'all');
    
    %% Clustering
    cluster = 8;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance890(i,h) = 6371*b*1000;
        
        end
        Distances890(i,1) = min(Distance890(i,:));
    end
    
    Distance_Between_Stations890 = [Distance_Between_Stations890 Distances890];
    Average_Distance_Between_Stations890 = mean(Distance_Between_Stations890,'all');
    
    %% Clustering
    cluster = 12;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance1290(i,h) = 6371*b*1000;
        
        end
        Distances1290(i,1) = min(Distance1290(i,:));
    end
    
    Distance_Between_Stations1290 = [Distance_Between_Stations1290 Distances1290];
    Average_Distance_Between_Stations1290 = mean(Distance_Between_Stations1290,'all');
    
    %% Clustering
    cluster = 16;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance1690(i,h) = 6371*b*1000;
        
        end
        Distances1690(i,1) = min(Distance1690(i,:));
    end
    
    Distance_Between_Stations1690 = [Distance_Between_Stations1690 Distances1690];
    Average_Distance_Between_Stations1690 = mean(Distance_Between_Stations1690,'all');
    
end

%% Monte Carlo 100% Deviation
Error = [-1 1];

for g = 1:1:Number_of_Simulations
    
    
    for k = 1:1:size(Dem_Original,2)
   
        Dem_Deviated(1,k) = Dem_Original(1,k) + Error(1,randi([1,2]))*Dem_Original(1,k);
    
    end

    G_Original = {}; % Original Demand Distribution Data
    G_Deviated = {}; % Deviated Demand Distribution Data

    for i = 1:1:size(Dem_Original,2)
 
        F_Original = [];
    
        for j = 1:1:Dem_Original(i)
        
            F_Original(1,j) = Long(i);
            F_Original(2,j) = Lat(i);
  
        end
    
        F_Deviated = [];
    
        for n = 1:1:Dem_Deviated(i)
        
           F_Deviated(1,n) = Long(i);
           F_Deviated(2,n) = Lat(i);

        end
    
        G_Original{1,i} = F_Original;
        G_Deviated{1,i} = F_Deviated;
    
    end

    Data_Original = cell2mat(G_Original);
    Location_Original = transpose(Data_Original);
    Data_Deviated = cell2mat(G_Deviated);
    Location_Deviated = transpose(Data_Deviated);

    %% Clustering
    cluster = 4;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance4100(i,h) = 6371*b*1000;
        
        end
        Distances4100(i,1) = min(Distance4100(i,:));
    end
    
    Distance_Between_Stations4100 = [Distance_Between_Stations4100 Distances4100];
    Average_Distance_Between_Stations4100 = mean(Distance_Between_Stations4100,'all');
    
    %% Clustering
    cluster = 8;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance8100(i,h) = 6371*b*1000;
        
        end
        Distances8100(i,1) = min(Distance8100(i,:));
    end
    
    Distance_Between_Stations8100 = [Distance_Between_Stations8100 Distances8100];
    Average_Distance_Between_Stations8100 = mean(Distance_Between_Stations8100,'all');
    
    %% Clustering
    cluster = 12;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance12100(i,h) = 6371*b*1000;
        
        end
        Distances12100(i,1) = min(Distance12100(i,:));
    end
    
    Distance_Between_Stations12100 = [Distance_Between_Stations12100 Distances12100];
    Average_Distance_Between_Stations12100 = mean(Distance_Between_Stations12100,'all');
    
    %% Clustering
    cluster = 16;
    [idx_Original,C_Original] = kmeans(Location_Original,cluster,'MaxIter',1000,'Replicates',100);
    [idx_Deviated,C_Deviated] = kmeans(Location_Deviated,cluster,'MaxIter',1000,'Replicates',100);

    %% Haversine_Equation
    for i = 1:1:cluster
        for h = 1:1:cluster
       
            a = (sin((C_Deviated(h,2)*(pi/180) - C_Original(i,2)*(pi/180))/2))^2 + cos(C_Original(i,2)*(pi/180))*cos(C_Deviated(h,2)*(pi/180))*(sin((C_Deviated(h,1)*(pi/180) - C_Original(i,1)*(pi/180))/2))^2;
            b = 2*atan2(sqrt(a),sqrt(1-a));
            Distance16100(i,h) = 6371*b*1000;
        
        end
        Distances16100(i,1) = min(Distance16100(i,:));
    end
    
    Distance_Between_Stations16100 = [Distance_Between_Stations16100 Distances16100];
    Average_Distance_Between_Stations16100 = mean(Distance_Between_Stations16100,'all');
    
end


%% Plots
Demand_Error = [10 20 30 40 50 60 70 80 90 100];
Mean_Deviated_Distance4 = [Average_Distance_Between_Stations410 Average_Distance_Between_Stations420 Average_Distance_Between_Stations430 Average_Distance_Between_Stations440 Average_Distance_Between_Stations450 Average_Distance_Between_Stations460 Average_Distance_Between_Stations470 Average_Distance_Between_Stations480 Average_Distance_Between_Stations490 Average_Distance_Between_Stations4100]; 
Mean_Deviated_Distance8 = [Average_Distance_Between_Stations810 Average_Distance_Between_Stations820 Average_Distance_Between_Stations830 Average_Distance_Between_Stations840 Average_Distance_Between_Stations850 Average_Distance_Between_Stations860 Average_Distance_Between_Stations870 Average_Distance_Between_Stations880 Average_Distance_Between_Stations890 Average_Distance_Between_Stations8100]; 
Mean_Deviated_Distance12 = [Average_Distance_Between_Stations1210 Average_Distance_Between_Stations1220 Average_Distance_Between_Stations1230 Average_Distance_Between_Stations1240 Average_Distance_Between_Stations1250 Average_Distance_Between_Stations1260 Average_Distance_Between_Stations1270 Average_Distance_Between_Stations1280 Average_Distance_Between_Stations1290 Average_Distance_Between_Stations12100]; 
Mean_Deviated_Distance16 = [Average_Distance_Between_Stations1610 Average_Distance_Between_Stations1620 Average_Distance_Between_Stations1630 Average_Distance_Between_Stations1640 Average_Distance_Between_Stations1650 Average_Distance_Between_Stations1660 Average_Distance_Between_Stations1670 Average_Distance_Between_Stations1680 Average_Distance_Between_Stations1690 Average_Distance_Between_Stations16100]; 

figure('Name','Demand Error')
plot(Demand_Error,Mean_Deviated_Distance4,'-k')
hold on
plot(Demand_Error,Mean_Deviated_Distance8,'-b')
hold on
plot(Demand_Error,Mean_Deviated_Distance12,'-g')
hold on
plot(Demand_Error,Mean_Deviated_Distance16,'-r')
grid on
title('\it Impact od Demand Error on Stations Location')
xlabel('\it Percentage of Error (%)')
ylabel('\it Average Deviation of Stations Location (m)')
legend('4 Stations','8 Stations','12 Stations','16 Stations','Location','southeast','NumColumns',4,'FontSize',8)
