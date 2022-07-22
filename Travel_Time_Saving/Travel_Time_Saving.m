%% Travel Time Saving
clc
clear

%% 4 Passengers
X0 = 0;
Y0 = 0;
Yd = 0;
Number_of_Passenger = 4;
UAM_Time = [];
j = 1;

for Xd = 10000:10000:80000
    
    Range = Xd;
    h0 = find_best_h(Range,Number_of_Passenger);
    [Total_E, Total_T] = flight(X0,Y0,Xd,Yd,h0,Number_of_Passenger);
    UAM_Time = [UAM_Time Total_T];
    
end

%% Monte Carlo Range 10000
Routing_Factor = 1.42;
AVG_Speed_Taxi = [5 10 20];
Number_of_Simulations = 10000000;
i = 1;
taw_R10000_V5 = [];
taw_R10000_V10 = [];
taw_R10000_V20 = [];

for Desired_Time_Saving = 0.1:0.1:0.9
    
    j = 1;
    
    for montecounter = 1:1:Number_of_Simulations
        
        t_O = 2*pi*rand;
        r_O = 5000*sqrt(rand);
        X_O = 0 + r_O*cos(t_O); % Random X Location Inside a Circle
        Y_O = 0 + r_O*sin(t_O); % Random Y Location Inside a Circle
        t_D = 2*pi*rand;
        r_D = 5000*sqrt(rand);
        X_D = 10000 + r_D*cos(t_D);
        Y_D = 0 + r_D*sin(t_D);
    
        Distance = sqrt((X_D - X_O)^2 + (Y_D - Y_O)^2);
    
        taw_R10000_V5(i,j) = (1-Desired_Time_Saving)*((Distance*Routing_Factor)/(AVG_Speed_Taxi(1,1))) - UAM_Time(1,1);
        taw_R10000_V10(i,j) = (1-Desired_Time_Saving)*((Distance*Routing_Factor)/(AVG_Speed_Taxi(1,2))) - UAM_Time(1,1);
        taw_R10000_V20(i,j) = (1-Desired_Time_Saving)*((Distance*Routing_Factor)/(AVG_Speed_Taxi(1,3))) - UAM_Time(1,1);
        
        j = j + 1;
    end
    
    i = i + 1;
    
end
Mean_taw_R10000_V5_S10 = mean(taw_R10000_V5(1,:));
Mean_taw_R10000_V5_S20 = mean(taw_R10000_V5(2,:));
Mean_taw_R10000_V5_S30 = mean(taw_R10000_V5(3,:));
Mean_taw_R10000_V5_S40 = mean(taw_R10000_V5(4,:));
Mean_taw_R10000_V5_S50 = mean(taw_R10000_V5(5,:));
Mean_taw_R10000_V5_S60 = mean(taw_R10000_V5(6,:));
Mean_taw_R10000_V5_S70 = mean(taw_R10000_V5(7,:));
Mean_taw_R10000_V5_S80 = mean(taw_R10000_V5(8,:));
Mean_taw_R10000_V5_S90 = mean(taw_R10000_V5(9,:));

MeanMin_taw_R10000_V5_S10 = round(mean(taw_R10000_V5(1,:))/60);
MeanMin_taw_R10000_V5_S20 = round(mean(taw_R10000_V5(2,:))/60);
MeanMin_taw_R10000_V5_S30 = round(mean(taw_R10000_V5(3,:))/60);
MeanMin_taw_R10000_V5_S40 = round(mean(taw_R10000_V5(4,:))/60);
MeanMin_taw_R10000_V5_S50 = round(mean(taw_R10000_V5(5,:))/60);
MeanMin_taw_R10000_V5_S60 = round(mean(taw_R10000_V5(6,:))/60);
MeanMin_taw_R10000_V5_S70 = round(mean(taw_R10000_V5(7,:))/60);
MeanMin_taw_R10000_V5_S80 = round(mean(taw_R10000_V5(8,:))/60);
MeanMin_taw_R10000_V5_S90 = round(mean(taw_R10000_V5(9,:))/60);

Mean_taw_R10000_V10_S10 = mean(taw_R10000_V10(1,:));
Mean_taw_R10000_V10_S20 = mean(taw_R10000_V10(2,:));
Mean_taw_R10000_V10_S30 = mean(taw_R10000_V10(3,:));
Mean_taw_R10000_V10_S40 = mean(taw_R10000_V10(4,:));
Mean_taw_R10000_V10_S50 = mean(taw_R10000_V10(5,:));
Mean_taw_R10000_V10_S60 = mean(taw_R10000_V10(6,:));
Mean_taw_R10000_V10_S70 = mean(taw_R10000_V10(7,:));
Mean_taw_R10000_V10_S80 = mean(taw_R10000_V10(8,:));
Mean_taw_R10000_V10_S90 = mean(taw_R10000_V10(9,:));

MeanMin_taw_R10000_V10_S10 = round(mean(taw_R10000_V10(1,:))/60);
MeanMin_taw_R10000_V10_S20 = round(mean(taw_R10000_V10(2,:))/60);
MeanMin_taw_R10000_V10_S30 = round(mean(taw_R10000_V10(3,:))/60);
MeanMin_taw_R10000_V10_S40 = round(mean(taw_R10000_V10(4,:))/60);
MeanMin_taw_R10000_V10_S50 = round(mean(taw_R10000_V10(5,:))/60);
MeanMin_taw_R10000_V10_S60 = round(mean(taw_R10000_V10(6,:))/60);
MeanMin_taw_R10000_V10_S70 = round(mean(taw_R10000_V10(7,:))/60);
MeanMin_taw_R10000_V10_S80 = round(mean(taw_R10000_V10(8,:))/60);
MeanMin_taw_R10000_V10_S90 = round(mean(taw_R10000_V10(9,:))/60);

Mean_taw_R10000_V20_S10 = mean(taw_R10000_V20(1,:));
Mean_taw_R10000_V20_S20 = mean(taw_R10000_V20(2,:));
Mean_taw_R10000_V20_S30 = mean(taw_R10000_V20(3,:));
Mean_taw_R10000_V20_S40 = mean(taw_R10000_V20(4,:));
Mean_taw_R10000_V20_S50 = mean(taw_R10000_V20(5,:));
Mean_taw_R10000_V20_S60 = mean(taw_R10000_V20(6,:));
Mean_taw_R10000_V20_S70 = mean(taw_R10000_V20(7,:));
Mean_taw_R10000_V20_S80 = mean(taw_R10000_V20(8,:));
Mean_taw_R10000_V20_S90 = mean(taw_R10000_V20(9,:));

MeanMin_taw_R10000_V20_S10 = round(mean(taw_R10000_V20(1,:))/60);
MeanMin_taw_R10000_V20_S20 = round(mean(taw_R10000_V20(2,:))/60);
MeanMin_taw_R10000_V20_S30 = round(mean(taw_R10000_V20(3,:))/60);
MeanMin_taw_R10000_V20_S40 = round(mean(taw_R10000_V20(4,:))/60);
MeanMin_taw_R10000_V20_S50 = round(mean(taw_R10000_V20(5,:))/60);
MeanMin_taw_R10000_V20_S60 = round(mean(taw_R10000_V20(6,:))/60);
MeanMin_taw_R10000_V20_S70 = round(mean(taw_R10000_V20(7,:))/60);
MeanMin_taw_R10000_V20_S80 = round(mean(taw_R10000_V20(8,:))/60);
MeanMin_taw_R10000_V20_S90 = round(mean(taw_R10000_V20(9,:))/60);

%% Monte Carlo Range 20000
i = 1;
taw_R20000_V5 = [];
taw_R20000_V10 = [];
taw_R20000_V20 = [];

for Desired_Time_Saving = 0.1:0.1:0.9
    
    j = 1;
    
    for montecounter = 1:1:Number_of_Simulations
        
        t_O = 2*pi*rand;
        r_O = 5000*sqrt(rand);
        X_O = 0 + r_O*cos(t_O); % Random X Location Inside a Circle
        Y_O = 0 + r_O*sin(t_O); % Random Y Location Inside a Circle
        t_D = 2*pi*rand;
        r_D = 5000*sqrt(rand);
        X_D = 20000 + r_D*cos(t_D);
        Y_D = 0 + r_D*sin(t_D);
    
        Distance = sqrt((X_D - X_O)^2 + (Y_D - Y_O)^2);
    
        taw_R20000_V5(i,j) = (1-Desired_Time_Saving)*((Distance*Routing_Factor)/(AVG_Speed_Taxi(1,1))) - UAM_Time(1,1);
        taw_R20000_V10(i,j) = (1-Desired_Time_Saving)*((Distance*Routing_Factor)/(AVG_Speed_Taxi(1,2))) - UAM_Time(1,1);
        taw_R20000_V20(i,j) = (1-Desired_Time_Saving)*((Distance*Routing_Factor)/(AVG_Speed_Taxi(1,3))) - UAM_Time(1,1);
        
        j = j + 1;
    end
    
    i = i + 1;
    
end
Mean_taw_R20000_V5_S10 = mean(taw_R20000_V5(1,:));
Mean_taw_R20000_V5_S20 = mean(taw_R20000_V5(2,:));
Mean_taw_R20000_V5_S30 = mean(taw_R20000_V5(3,:));
Mean_taw_R20000_V5_S40 = mean(taw_R20000_V5(4,:));
Mean_taw_R20000_V5_S50 = mean(taw_R20000_V5(5,:));
Mean_taw_R20000_V5_S60 = mean(taw_R20000_V5(6,:));
Mean_taw_R20000_V5_S70 = mean(taw_R20000_V5(7,:));
Mean_taw_R20000_V5_S80 = mean(taw_R20000_V5(8,:));
Mean_taw_R20000_V5_S90 = mean(taw_R20000_V5(9,:));

MeanMin_taw_R20000_V5_S10 = round(mean(taw_R20000_V5(1,:))/60);
MeanMin_taw_R20000_V5_S20 = round(mean(taw_R20000_V5(2,:))/60);
MeanMin_taw_R20000_V5_S30 = round(mean(taw_R20000_V5(3,:))/60);
MeanMin_taw_R20000_V5_S40 = round(mean(taw_R20000_V5(4,:))/60);
MeanMin_taw_R20000_V5_S50 = round(mean(taw_R20000_V5(5,:))/60);
MeanMin_taw_R20000_V5_S60 = round(mean(taw_R20000_V5(6,:))/60);
MeanMin_taw_R20000_V5_S70 = round(mean(taw_R20000_V5(7,:))/60);
MeanMin_taw_R20000_V5_S80 = round(mean(taw_R20000_V5(8,:))/60);
MeanMin_taw_R20000_V5_S90 = round(mean(taw_R20000_V5(9,:))/60);

Mean_taw_R20000_V10_S10 = mean(taw_R20000_V10(1,:));
Mean_taw_R20000_V10_S20 = mean(taw_R20000_V10(2,:));
Mean_taw_R20000_V10_S30 = mean(taw_R20000_V10(3,:));
Mean_taw_R20000_V10_S40 = mean(taw_R20000_V10(4,:));
Mean_taw_R20000_V10_S50 = mean(taw_R20000_V10(5,:));
Mean_taw_R20000_V10_S60 = mean(taw_R20000_V10(6,:));
Mean_taw_R20000_V10_S70 = mean(taw_R20000_V10(7,:));
Mean_taw_R20000_V10_S80 = mean(taw_R20000_V10(8,:));
Mean_taw_R20000_V10_S90 = mean(taw_R20000_V10(9,:));

MeanMin_taw_R20000_V10_S10 = round(mean(taw_R20000_V10(1,:))/60);
MeanMin_taw_R20000_V10_S20 = round(mean(taw_R20000_V10(2,:))/60);
MeanMin_taw_R20000_V10_S30 = round(mean(taw_R20000_V10(3,:))/60);
MeanMin_taw_R20000_V10_S40 = round(mean(taw_R20000_V10(4,:))/60);
MeanMin_taw_R20000_V10_S50 = round(mean(taw_R20000_V10(5,:))/60);
MeanMin_taw_R20000_V10_S60 = round(mean(taw_R20000_V10(6,:))/60);
MeanMin_taw_R20000_V10_S70 = round(mean(taw_R20000_V10(7,:))/60);
MeanMin_taw_R20000_V10_S80 = round(mean(taw_R20000_V10(8,:))/60);
MeanMin_taw_R20000_V10_S90 = round(mean(taw_R20000_V10(9,:))/60);

Mean_taw_R20000_V20_S10 = mean(taw_R20000_V20(1,:));
Mean_taw_R20000_V20_S20 = mean(taw_R20000_V20(2,:));
Mean_taw_R20000_V20_S30 = mean(taw_R20000_V20(3,:));
Mean_taw_R20000_V20_S40 = mean(taw_R20000_V20(4,:));
Mean_taw_R20000_V20_S50 = mean(taw_R20000_V20(5,:));
Mean_taw_R20000_V20_S60 = mean(taw_R20000_V20(6,:));
Mean_taw_R20000_V20_S70 = mean(taw_R20000_V20(7,:));
Mean_taw_R20000_V20_S80 = mean(taw_R20000_V20(8,:));
Mean_taw_R20000_V20_S90 = mean(taw_R20000_V20(9,:));

MeanMin_taw_R20000_V20_S10 = round(mean(taw_R20000_V20(1,:))/60);
MeanMin_taw_R20000_V20_S20 = round(mean(taw_R20000_V20(2,:))/60);
MeanMin_taw_R20000_V20_S30 = round(mean(taw_R20000_V20(3,:))/60);
MeanMin_taw_R20000_V20_S40 = round(mean(taw_R20000_V20(4,:))/60);
MeanMin_taw_R20000_V20_S50 = round(mean(taw_R20000_V20(5,:))/60);
MeanMin_taw_R20000_V20_S60 = round(mean(taw_R20000_V20(6,:))/60);
MeanMin_taw_R20000_V20_S70 = round(mean(taw_R20000_V20(7,:))/60);
MeanMin_taw_R20000_V20_S80 = round(mean(taw_R20000_V20(8,:))/60);
MeanMin_taw_R20000_V20_S90 = round(mean(taw_R20000_V20(9,:))/60);

%% Monte Carlo Range 30000
i = 1;
taw_R30000_V5 = [];
taw_R30000_V10 = [];
taw_R30000_V20 = [];

for Desired_Time_Saving = 0.1:0.1:0.9
    
    j = 1;
    
    for montecounter = 1:1:Number_of_Simulations
        
        t_O = 2*pi*rand;
        r_O = 5000*sqrt(rand);
        X_O = 0 + r_O*cos(t_O); % Random X Location Inside a Circle
        Y_O = 0 + r_O*sin(t_O); % Random Y Location Inside a Circle
        t_D = 2*pi*rand;
        r_D = 5000*sqrt(rand);
        X_D = 30000 + r_D*cos(t_D);
        Y_D = 0 + r_D*sin(t_D);
    
        Distance = sqrt((X_D - X_O)^2 + (Y_D - Y_O)^2);
    
        taw_R30000_V5(i,j) = (1-Desired_Time_Saving)*((Distance*Routing_Factor)/(AVG_Speed_Taxi(1,1))) - UAM_Time(1,1);
        taw_R30000_V10(i,j) = (1-Desired_Time_Saving)*((Distance*Routing_Factor)/(AVG_Speed_Taxi(1,2))) - UAM_Time(1,1);
        taw_R30000_V20(i,j) = (1-Desired_Time_Saving)*((Distance*Routing_Factor)/(AVG_Speed_Taxi(1,3))) - UAM_Time(1,1);
        
        j = j + 1;
    end
    
    i = i + 1;
    
end
Mean_taw_R30000_V5_S10 = mean(taw_R30000_V5(1,:));
Mean_taw_R30000_V5_S20 = mean(taw_R30000_V5(2,:));
Mean_taw_R30000_V5_S30 = mean(taw_R30000_V5(3,:));
Mean_taw_R30000_V5_S40 = mean(taw_R30000_V5(4,:));
Mean_taw_R30000_V5_S50 = mean(taw_R30000_V5(5,:));
Mean_taw_R30000_V5_S60 = mean(taw_R30000_V5(6,:));
Mean_taw_R30000_V5_S70 = mean(taw_R30000_V5(7,:));
Mean_taw_R30000_V5_S80 = mean(taw_R30000_V5(8,:));
Mean_taw_R30000_V5_S90 = mean(taw_R30000_V5(9,:));

MeanMin_taw_R30000_V5_S10 = round(mean(taw_R30000_V5(1,:))/60);
MeanMin_taw_R30000_V5_S20 = round(mean(taw_R30000_V5(2,:))/60);
MeanMin_taw_R30000_V5_S30 = round(mean(taw_R30000_V5(3,:))/60);
MeanMin_taw_R30000_V5_S40 = round(mean(taw_R30000_V5(4,:))/60);
MeanMin_taw_R30000_V5_S50 = round(mean(taw_R30000_V5(5,:))/60);
MeanMin_taw_R30000_V5_S60 = round(mean(taw_R30000_V5(6,:))/60);
MeanMin_taw_R30000_V5_S70 = round(mean(taw_R30000_V5(7,:))/60);
MeanMin_taw_R30000_V5_S80 = round(mean(taw_R30000_V5(8,:))/60);
MeanMin_taw_R30000_V5_S90 = round(mean(taw_R30000_V5(9,:))/60);

Mean_taw_R30000_V10_S10 = mean(taw_R30000_V10(1,:));
Mean_taw_R30000_V10_S20 = mean(taw_R30000_V10(2,:));
Mean_taw_R30000_V10_S30 = mean(taw_R30000_V10(3,:));
Mean_taw_R30000_V10_S40 = mean(taw_R30000_V10(4,:));
Mean_taw_R30000_V10_S50 = mean(taw_R30000_V10(5,:));
Mean_taw_R30000_V10_S60 = mean(taw_R30000_V10(6,:));
Mean_taw_R30000_V10_S70 = mean(taw_R30000_V10(7,:));
Mean_taw_R30000_V10_S80 = mean(taw_R30000_V10(8,:));
Mean_taw_R30000_V10_S90 = mean(taw_R30000_V10(9,:));

MeanMin_taw_R30000_V10_S10 = round(mean(taw_R30000_V10(1,:))/60);
MeanMin_taw_R30000_V10_S20 = round(mean(taw_R30000_V10(2,:))/60);
MeanMin_taw_R30000_V10_S30 = round(mean(taw_R30000_V10(3,:))/60);
MeanMin_taw_R30000_V10_S40 = round(mean(taw_R30000_V10(4,:))/60);
MeanMin_taw_R30000_V10_S50 = round(mean(taw_R30000_V10(5,:))/60);
MeanMin_taw_R30000_V10_S60 = round(mean(taw_R30000_V10(6,:))/60);
MeanMin_taw_R30000_V10_S70 = round(mean(taw_R30000_V10(7,:))/60);
MeanMin_taw_R30000_V10_S80 = round(mean(taw_R30000_V10(8,:))/60);
MeanMin_taw_R30000_V10_S90 = round(mean(taw_R30000_V10(9,:))/60);

Mean_taw_R30000_V20_S10 = mean(taw_R30000_V20(1,:));
Mean_taw_R30000_V20_S20 = mean(taw_R30000_V20(2,:));
Mean_taw_R30000_V20_S30 = mean(taw_R30000_V20(3,:));
Mean_taw_R30000_V20_S40 = mean(taw_R30000_V20(4,:));
Mean_taw_R30000_V20_S50 = mean(taw_R30000_V20(5,:));
Mean_taw_R30000_V20_S60 = mean(taw_R30000_V20(6,:));
Mean_taw_R30000_V20_S70 = mean(taw_R30000_V20(7,:));
Mean_taw_R30000_V20_S80 = mean(taw_R30000_V20(8,:));
Mean_taw_R30000_V20_S90 = mean(taw_R30000_V20(9,:));

MeanMin_taw_R30000_V20_S10 = round(mean(taw_R30000_V20(1,:))/60);
MeanMin_taw_R30000_V20_S20 = round(mean(taw_R30000_V20(2,:))/60);
MeanMin_taw_R30000_V20_S30 = round(mean(taw_R30000_V20(3,:))/60);
MeanMin_taw_R30000_V20_S40 = round(mean(taw_R30000_V20(4,:))/60);
MeanMin_taw_R30000_V20_S50 = round(mean(taw_R30000_V20(5,:))/60);
MeanMin_taw_R30000_V20_S60 = round(mean(taw_R30000_V20(6,:))/60);
MeanMin_taw_R30000_V20_S70 = round(mean(taw_R30000_V20(7,:))/60);
MeanMin_taw_R30000_V20_S80 = round(mean(taw_R30000_V20(8,:))/60);
MeanMin_taw_R30000_V20_S90 = round(mean(taw_R30000_V20(9,:))/60);

%% Monte Carlo Range 40000
i = 1;
taw_R40000_V5 = [];
taw_R40000_V10 = [];
taw_R40000_V20 = [];

for Desired_Time_Saving = 0.1:0.1:0.9
    
    j = 1;
    
    for montecounter = 1:1:Number_of_Simulations
        
        t_O = 2*pi*rand;
        r_O = 5000*sqrt(rand);
        X_O = 0 + r_O*cos(t_O); % Random X Location Inside a Circle
        Y_O = 0 + r_O*sin(t_O); % Random Y Location Inside a Circle
        t_D = 2*pi*rand;
        r_D = 5000*sqrt(rand);
        X_D = 40000 + r_D*cos(t_D);
        Y_D = 0 + r_D*sin(t_D);
    
        Distance = sqrt((X_D - X_O)^2 + (Y_D - Y_O)^2);
    
        taw_R40000_V5(i,j) = (1-Desired_Time_Saving)*((Distance*Routing_Factor)/(AVG_Speed_Taxi(1,1))) - UAM_Time(1,1);
        taw_R40000_V10(i,j) = (1-Desired_Time_Saving)*((Distance*Routing_Factor)/(AVG_Speed_Taxi(1,2))) - UAM_Time(1,1);
        taw_R40000_V20(i,j) = (1-Desired_Time_Saving)*((Distance*Routing_Factor)/(AVG_Speed_Taxi(1,3))) - UAM_Time(1,1);
        
        j = j + 1;
    end
    
    i = i + 1;
    
end
Mean_taw_R40000_V5_S10 = mean(taw_R40000_V5(1,:));
Mean_taw_R40000_V5_S20 = mean(taw_R40000_V5(2,:));
Mean_taw_R40000_V5_S30 = mean(taw_R40000_V5(3,:));
Mean_taw_R40000_V5_S40 = mean(taw_R40000_V5(4,:));
Mean_taw_R40000_V5_S50 = mean(taw_R40000_V5(5,:));
Mean_taw_R40000_V5_S60 = mean(taw_R40000_V5(6,:));
Mean_taw_R40000_V5_S70 = mean(taw_R40000_V5(7,:));
Mean_taw_R40000_V5_S80 = mean(taw_R40000_V5(8,:));
Mean_taw_R40000_V5_S90 = mean(taw_R40000_V5(9,:));

MeanMin_taw_R40000_V5_S10 = round(mean(taw_R40000_V5(1,:))/60);
MeanMin_taw_R40000_V5_S20 = round(mean(taw_R40000_V5(2,:))/60);
MeanMin_taw_R40000_V5_S30 = round(mean(taw_R40000_V5(3,:))/60);
MeanMin_taw_R40000_V5_S40 = round(mean(taw_R40000_V5(4,:))/60);
MeanMin_taw_R40000_V5_S50 = round(mean(taw_R40000_V5(5,:))/60);
MeanMin_taw_R40000_V5_S60 = round(mean(taw_R40000_V5(6,:))/60);
MeanMin_taw_R40000_V5_S70 = round(mean(taw_R40000_V5(7,:))/60);
MeanMin_taw_R40000_V5_S80 = round(mean(taw_R40000_V5(8,:))/60);
MeanMin_taw_R40000_V5_S90 = round(mean(taw_R40000_V5(9,:))/60);

Mean_taw_R40000_V10_S10 = mean(taw_R40000_V10(1,:));
Mean_taw_R40000_V10_S20 = mean(taw_R40000_V10(2,:));
Mean_taw_R40000_V10_S30 = mean(taw_R40000_V10(3,:));
Mean_taw_R40000_V10_S40 = mean(taw_R40000_V10(4,:));
Mean_taw_R40000_V10_S50 = mean(taw_R40000_V10(5,:));
Mean_taw_R40000_V10_S60 = mean(taw_R40000_V10(6,:));
Mean_taw_R40000_V10_S70 = mean(taw_R40000_V10(7,:));
Mean_taw_R40000_V10_S80 = mean(taw_R40000_V10(8,:));
Mean_taw_R40000_V10_S90 = mean(taw_R40000_V10(9,:));

MeanMin_taw_R40000_V10_S10 = round(mean(taw_R40000_V10(1,:))/60);
MeanMin_taw_R40000_V10_S20 = round(mean(taw_R40000_V10(2,:))/60);
MeanMin_taw_R40000_V10_S30 = round(mean(taw_R40000_V10(3,:))/60);
MeanMin_taw_R40000_V10_S40 = round(mean(taw_R40000_V10(4,:))/60);
MeanMin_taw_R40000_V10_S50 = round(mean(taw_R40000_V10(5,:))/60);
MeanMin_taw_R40000_V10_S60 = round(mean(taw_R40000_V10(6,:))/60);
MeanMin_taw_R40000_V10_S70 = round(mean(taw_R40000_V10(7,:))/60);
MeanMin_taw_R40000_V10_S80 = round(mean(taw_R40000_V10(8,:))/60);
MeanMin_taw_R40000_V10_S90 = round(mean(taw_R40000_V10(9,:))/60);

Mean_taw_R40000_V20_S10 = mean(taw_R40000_V20(1,:));
Mean_taw_R40000_V20_S20 = mean(taw_R40000_V20(2,:));
Mean_taw_R40000_V20_S30 = mean(taw_R40000_V20(3,:));
Mean_taw_R40000_V20_S40 = mean(taw_R40000_V20(4,:));
Mean_taw_R40000_V20_S50 = mean(taw_R40000_V20(5,:));
Mean_taw_R40000_V20_S60 = mean(taw_R40000_V20(6,:));
Mean_taw_R40000_V20_S70 = mean(taw_R40000_V20(7,:));
Mean_taw_R40000_V20_S80 = mean(taw_R40000_V20(8,:));
Mean_taw_R40000_V20_S90 = mean(taw_R40000_V20(9,:));

MeanMin_taw_R40000_V20_S10 = round(mean(taw_R40000_V20(1,:))/60);
MeanMin_taw_R40000_V20_S20 = round(mean(taw_R40000_V20(2,:))/60);
MeanMin_taw_R40000_V20_S30 = round(mean(taw_R40000_V20(3,:))/60);
MeanMin_taw_R40000_V20_S40 = round(mean(taw_R40000_V20(4,:))/60);
MeanMin_taw_R40000_V20_S50 = round(mean(taw_R40000_V20(5,:))/60);
MeanMin_taw_R40000_V20_S60 = round(mean(taw_R40000_V20(6,:))/60);
MeanMin_taw_R40000_V20_S70 = round(mean(taw_R40000_V20(7,:))/60);
MeanMin_taw_R40000_V20_S80 = round(mean(taw_R40000_V20(8,:))/60);
MeanMin_taw_R40000_V20_S90 = round(mean(taw_R40000_V20(9,:))/60);

%% Monte Carlo Range 50000
i = 1;
taw_R50000_V5 = [];
taw_R50000_V10 = [];
taw_R50000_V20 = [];

for Desired_Time_Saving = 0.1:0.1:0.9
    
    j = 1;
    
    for montecounter = 1:1:Number_of_Simulations
        
        t_O = 2*pi*rand;
        r_O = 5000*sqrt(rand);
        X_O = 0 + r_O*cos(t_O); % Random X Location Inside a Circle
        Y_O = 0 + r_O*sin(t_O); % Random Y Location Inside a Circle
        t_D = 2*pi*rand;
        r_D = 5000*sqrt(rand);
        X_D = 50000 + r_D*cos(t_D);
        Y_D = 0 + r_D*sin(t_D);
    
        Distance = sqrt((X_D - X_O)^2 + (Y_D - Y_O)^2);
    
        taw_R50000_V5(i,j) = (1-Desired_Time_Saving)*((Distance*Routing_Factor)/(AVG_Speed_Taxi(1,1))) - UAM_Time(1,1);
        taw_R50000_V10(i,j) = (1-Desired_Time_Saving)*((Distance*Routing_Factor)/(AVG_Speed_Taxi(1,2))) - UAM_Time(1,1);
        taw_R50000_V20(i,j) = (1-Desired_Time_Saving)*((Distance*Routing_Factor)/(AVG_Speed_Taxi(1,3))) - UAM_Time(1,1);
        
        j = j + 1;
    end
    
    i = i + 1;
    
end
Mean_taw_R50000_V5_S10 = mean(taw_R50000_V5(1,:));
Mean_taw_R50000_V5_S20 = mean(taw_R50000_V5(2,:));
Mean_taw_R50000_V5_S30 = mean(taw_R50000_V5(3,:));
Mean_taw_R50000_V5_S40 = mean(taw_R50000_V5(4,:));
Mean_taw_R50000_V5_S50 = mean(taw_R50000_V5(5,:));
Mean_taw_R50000_V5_S60 = mean(taw_R50000_V5(6,:));
Mean_taw_R50000_V5_S70 = mean(taw_R50000_V5(7,:));
Mean_taw_R50000_V5_S80 = mean(taw_R50000_V5(8,:));
Mean_taw_R50000_V5_S90 = mean(taw_R50000_V5(9,:));

MeanMin_taw_R50000_V5_S10 = round(mean(taw_R50000_V5(1,:))/60);
MeanMin_taw_R50000_V5_S20 = round(mean(taw_R50000_V5(2,:))/60);
MeanMin_taw_R50000_V5_S30 = round(mean(taw_R50000_V5(3,:))/60);
MeanMin_taw_R50000_V5_S40 = round(mean(taw_R50000_V5(4,:))/60);
MeanMin_taw_R50000_V5_S50 = round(mean(taw_R50000_V5(5,:))/60);
MeanMin_taw_R50000_V5_S60 = round(mean(taw_R50000_V5(6,:))/60);
MeanMin_taw_R50000_V5_S70 = round(mean(taw_R50000_V5(7,:))/60);
MeanMin_taw_R50000_V5_S80 = round(mean(taw_R50000_V5(8,:))/60);
MeanMin_taw_R50000_V5_S90 = round(mean(taw_R50000_V5(9,:))/60);

Mean_taw_R50000_V10_S10 = mean(taw_R50000_V10(1,:));
Mean_taw_R50000_V10_S20 = mean(taw_R50000_V10(2,:));
Mean_taw_R50000_V10_S30 = mean(taw_R50000_V10(3,:));
Mean_taw_R50000_V10_S40 = mean(taw_R50000_V10(4,:));
Mean_taw_R50000_V10_S50 = mean(taw_R50000_V10(5,:));
Mean_taw_R50000_V10_S60 = mean(taw_R50000_V10(6,:));
Mean_taw_R50000_V10_S70 = mean(taw_R50000_V10(7,:));
Mean_taw_R50000_V10_S80 = mean(taw_R50000_V10(8,:));
Mean_taw_R50000_V10_S90 = mean(taw_R50000_V10(9,:));

MeanMin_taw_R50000_V10_S10 = round(mean(taw_R50000_V10(1,:))/60);
MeanMin_taw_R50000_V10_S20 = round(mean(taw_R50000_V10(2,:))/60);
MeanMin_taw_R50000_V10_S30 = round(mean(taw_R50000_V10(3,:))/60);
MeanMin_taw_R50000_V10_S40 = round(mean(taw_R50000_V10(4,:))/60);
MeanMin_taw_R50000_V10_S50 = round(mean(taw_R50000_V10(5,:))/60);
MeanMin_taw_R50000_V10_S60 = round(mean(taw_R50000_V10(6,:))/60);
MeanMin_taw_R50000_V10_S70 = round(mean(taw_R50000_V10(7,:))/60);
MeanMin_taw_R50000_V10_S80 = round(mean(taw_R50000_V10(8,:))/60);
MeanMin_taw_R50000_V10_S90 = round(mean(taw_R50000_V10(9,:))/60);

Mean_taw_R50000_V20_S10 = mean(taw_R50000_V20(1,:));
Mean_taw_R50000_V20_S20 = mean(taw_R50000_V20(2,:));
Mean_taw_R50000_V20_S30 = mean(taw_R50000_V20(3,:));
Mean_taw_R50000_V20_S40 = mean(taw_R50000_V20(4,:));
Mean_taw_R50000_V20_S50 = mean(taw_R50000_V20(5,:));
Mean_taw_R50000_V20_S60 = mean(taw_R50000_V20(6,:));
Mean_taw_R50000_V20_S70 = mean(taw_R50000_V20(7,:));
Mean_taw_R50000_V20_S80 = mean(taw_R50000_V20(8,:));
Mean_taw_R50000_V20_S90 = mean(taw_R50000_V20(9,:));

MeanMin_taw_R50000_V20_S10 = round(mean(taw_R50000_V20(1,:))/60);
MeanMin_taw_R50000_V20_S20 = round(mean(taw_R50000_V20(2,:))/60);
MeanMin_taw_R50000_V20_S30 = round(mean(taw_R50000_V20(3,:))/60);
MeanMin_taw_R50000_V20_S40 = round(mean(taw_R50000_V20(4,:))/60);
MeanMin_taw_R50000_V20_S50 = round(mean(taw_R50000_V20(5,:))/60);
MeanMin_taw_R50000_V20_S60 = round(mean(taw_R50000_V20(6,:))/60);
MeanMin_taw_R50000_V20_S70 = round(mean(taw_R50000_V20(7,:))/60);
MeanMin_taw_R50000_V20_S80 = round(mean(taw_R50000_V20(8,:))/60);
MeanMin_taw_R50000_V20_S90 = round(mean(taw_R50000_V20(9,:))/60);

%% Monte Carlo Range 60000
i = 1;
taw_R60000_V5 = [];
taw_R60000_V10 = [];
taw_R60000_V20 = [];

for Desired_Time_Saving = 0.1:0.1:0.9
    
    j = 1;
    
    for montecounter = 1:1:Number_of_Simulations
        
        t_O = 2*pi*rand;
        r_O = 5000*sqrt(rand);
        X_O = 0 + r_O*cos(t_O); % Random X Location Inside a Circle
        Y_O = 0 + r_O*sin(t_O); % Random Y Location Inside a Circle
        t_D = 2*pi*rand;
        r_D = 5000*sqrt(rand);
        X_D = 60000 + r_D*cos(t_D);
        Y_D = 0 + r_D*sin(t_D);
    
        Distance = sqrt((X_D - X_O)^2 + (Y_D - Y_O)^2);
    
        taw_R60000_V5(i,j) = (1-Desired_Time_Saving)*((Distance*Routing_Factor)/(AVG_Speed_Taxi(1,1))) - UAM_Time(1,1);
        taw_R60000_V10(i,j) = (1-Desired_Time_Saving)*((Distance*Routing_Factor)/(AVG_Speed_Taxi(1,2))) - UAM_Time(1,1);
        taw_R60000_V20(i,j) = (1-Desired_Time_Saving)*((Distance*Routing_Factor)/(AVG_Speed_Taxi(1,3))) - UAM_Time(1,1);
        
        j = j + 1;
    end
    
    i = i + 1;
    
end
Mean_taw_R60000_V5_S10 = mean(taw_R60000_V5(1,:));
Mean_taw_R60000_V5_S20 = mean(taw_R60000_V5(2,:));
Mean_taw_R60000_V5_S30 = mean(taw_R60000_V5(3,:));
Mean_taw_R60000_V5_S40 = mean(taw_R60000_V5(4,:));
Mean_taw_R60000_V5_S50 = mean(taw_R60000_V5(5,:));
Mean_taw_R60000_V5_S60 = mean(taw_R60000_V5(6,:));
Mean_taw_R60000_V5_S70 = mean(taw_R60000_V5(7,:));
Mean_taw_R60000_V5_S80 = mean(taw_R60000_V5(8,:));
Mean_taw_R60000_V5_S90 = mean(taw_R60000_V5(9,:));

MeanMin_taw_R60000_V5_S10 = round(mean(taw_R60000_V5(1,:))/60);
MeanMin_taw_R60000_V5_S20 = round(mean(taw_R60000_V5(2,:))/60);
MeanMin_taw_R60000_V5_S30 = round(mean(taw_R60000_V5(3,:))/60);
MeanMin_taw_R60000_V5_S40 = round(mean(taw_R60000_V5(4,:))/60);
MeanMin_taw_R60000_V5_S50 = round(mean(taw_R60000_V5(5,:))/60);
MeanMin_taw_R60000_V5_S60 = round(mean(taw_R60000_V5(6,:))/60);
MeanMin_taw_R60000_V5_S70 = round(mean(taw_R60000_V5(7,:))/60);
MeanMin_taw_R60000_V5_S80 = round(mean(taw_R60000_V5(8,:))/60);
MeanMin_taw_R60000_V5_S90 = round(mean(taw_R60000_V5(9,:))/60);

Mean_taw_R60000_V10_S10 = mean(taw_R60000_V10(1,:));
Mean_taw_R60000_V10_S20 = mean(taw_R60000_V10(2,:));
Mean_taw_R60000_V10_S30 = mean(taw_R60000_V10(3,:));
Mean_taw_R60000_V10_S40 = mean(taw_R60000_V10(4,:));
Mean_taw_R60000_V10_S50 = mean(taw_R60000_V10(5,:));
Mean_taw_R60000_V10_S60 = mean(taw_R60000_V10(6,:));
Mean_taw_R60000_V10_S70 = mean(taw_R60000_V10(7,:));
Mean_taw_R60000_V10_S80 = mean(taw_R60000_V10(8,:));
Mean_taw_R60000_V10_S90 = mean(taw_R60000_V10(9,:));

MeanMin_taw_R60000_V10_S10 = round(mean(taw_R60000_V10(1,:))/60);
MeanMin_taw_R60000_V10_S20 = round(mean(taw_R60000_V10(2,:))/60);
MeanMin_taw_R60000_V10_S30 = round(mean(taw_R60000_V10(3,:))/60);
MeanMin_taw_R60000_V10_S40 = round(mean(taw_R60000_V10(4,:))/60);
MeanMin_taw_R60000_V10_S50 = round(mean(taw_R60000_V10(5,:))/60);
MeanMin_taw_R60000_V10_S60 = round(mean(taw_R60000_V10(6,:))/60);
MeanMin_taw_R60000_V10_S70 = round(mean(taw_R60000_V10(7,:))/60);
MeanMin_taw_R60000_V10_S80 = round(mean(taw_R60000_V10(8,:))/60);
MeanMin_taw_R60000_V10_S90 = round(mean(taw_R60000_V10(9,:))/60);

Mean_taw_R60000_V20_S10 = mean(taw_R60000_V20(1,:));
Mean_taw_R60000_V20_S20 = mean(taw_R60000_V20(2,:));
Mean_taw_R60000_V20_S30 = mean(taw_R60000_V20(3,:));
Mean_taw_R60000_V20_S40 = mean(taw_R60000_V20(4,:));
Mean_taw_R60000_V20_S50 = mean(taw_R60000_V20(5,:));
Mean_taw_R60000_V20_S60 = mean(taw_R60000_V20(6,:));
Mean_taw_R60000_V20_S70 = mean(taw_R60000_V20(7,:));
Mean_taw_R60000_V20_S80 = mean(taw_R60000_V20(8,:));
Mean_taw_R60000_V20_S90 = mean(taw_R60000_V20(9,:));

MeanMin_taw_R60000_V20_S10 = round(mean(taw_R60000_V20(1,:))/60);
MeanMin_taw_R60000_V20_S20 = round(mean(taw_R60000_V20(2,:))/60);
MeanMin_taw_R60000_V20_S30 = round(mean(taw_R60000_V20(3,:))/60);
MeanMin_taw_R60000_V20_S40 = round(mean(taw_R60000_V20(4,:))/60);
MeanMin_taw_R60000_V20_S50 = round(mean(taw_R60000_V20(5,:))/60);
MeanMin_taw_R60000_V20_S60 = round(mean(taw_R60000_V20(6,:))/60);
MeanMin_taw_R60000_V20_S70 = round(mean(taw_R60000_V20(7,:))/60);
MeanMin_taw_R60000_V20_S80 = round(mean(taw_R60000_V20(8,:))/60);
MeanMin_taw_R60000_V20_S90 = round(mean(taw_R60000_V20(9,:))/60);

%% Monte Carlo Range 70000
i = 1;
taw_R70000_V5 = [];
taw_R70000_V10 = [];
taw_R70000_V20 = [];

for Desired_Time_Saving = 0.1:0.1:0.9
    
    j = 1;
    
    for montecounter = 1:1:Number_of_Simulations
        
        t_O = 2*pi*rand;
        r_O = 5000*sqrt(rand);
        X_O = 0 + r_O*cos(t_O); % Random X Location Inside a Circle
        Y_O = 0 + r_O*sin(t_O); % Random Y Location Inside a Circle
        t_D = 2*pi*rand;
        r_D = 5000*sqrt(rand);
        X_D = 70000 + r_D*cos(t_D);
        Y_D = 0 + r_D*sin(t_D);
    
        Distance = sqrt((X_D - X_O)^2 + (Y_D - Y_O)^2);
    
        taw_R70000_V5(i,j) = (1-Desired_Time_Saving)*((Distance*Routing_Factor)/(AVG_Speed_Taxi(1,1))) - UAM_Time(1,1);
        taw_R70000_V10(i,j) = (1-Desired_Time_Saving)*((Distance*Routing_Factor)/(AVG_Speed_Taxi(1,2))) - UAM_Time(1,1);
        taw_R70000_V20(i,j) = (1-Desired_Time_Saving)*((Distance*Routing_Factor)/(AVG_Speed_Taxi(1,3))) - UAM_Time(1,1);
        
        j = j + 1;
    end
    
    i = i + 1;
    
end
Mean_taw_R70000_V5_S10 = mean(taw_R70000_V5(1,:));
Mean_taw_R70000_V5_S20 = mean(taw_R70000_V5(2,:));
Mean_taw_R70000_V5_S30 = mean(taw_R70000_V5(3,:));
Mean_taw_R70000_V5_S40 = mean(taw_R70000_V5(4,:));
Mean_taw_R70000_V5_S50 = mean(taw_R70000_V5(5,:));
Mean_taw_R70000_V5_S60 = mean(taw_R70000_V5(6,:));
Mean_taw_R70000_V5_S70 = mean(taw_R70000_V5(7,:));
Mean_taw_R70000_V5_S80 = mean(taw_R70000_V5(8,:));
Mean_taw_R70000_V5_S90 = mean(taw_R70000_V5(9,:));

MeanMin_taw_R70000_V5_S10 = round(mean(taw_R70000_V5(1,:))/60);
MeanMin_taw_R70000_V5_S20 = round(mean(taw_R70000_V5(2,:))/60);
MeanMin_taw_R70000_V5_S30 = round(mean(taw_R70000_V5(3,:))/60);
MeanMin_taw_R70000_V5_S40 = round(mean(taw_R70000_V5(4,:))/60);
MeanMin_taw_R70000_V5_S50 = round(mean(taw_R70000_V5(5,:))/60);
MeanMin_taw_R70000_V5_S60 = round(mean(taw_R70000_V5(6,:))/60);
MeanMin_taw_R70000_V5_S70 = round(mean(taw_R70000_V5(7,:))/60);
MeanMin_taw_R70000_V5_S80 = round(mean(taw_R70000_V5(8,:))/60);
MeanMin_taw_R70000_V5_S90 = round(mean(taw_R70000_V5(9,:))/60);

Mean_taw_R70000_V10_S10 = mean(taw_R70000_V10(1,:));
Mean_taw_R70000_V10_S20 = mean(taw_R70000_V10(2,:));
Mean_taw_R70000_V10_S30 = mean(taw_R70000_V10(3,:));
Mean_taw_R70000_V10_S40 = mean(taw_R70000_V10(4,:));
Mean_taw_R70000_V10_S50 = mean(taw_R70000_V10(5,:));
Mean_taw_R70000_V10_S60 = mean(taw_R70000_V10(6,:));
Mean_taw_R70000_V10_S70 = mean(taw_R70000_V10(7,:));
Mean_taw_R70000_V10_S80 = mean(taw_R70000_V10(8,:));
Mean_taw_R70000_V10_S90 = mean(taw_R70000_V10(9,:));

MeanMin_taw_R70000_V10_S10 = round(mean(taw_R70000_V10(1,:))/60);
MeanMin_taw_R70000_V10_S20 = round(mean(taw_R70000_V10(2,:))/60);
MeanMin_taw_R70000_V10_S30 = round(mean(taw_R70000_V10(3,:))/60);
MeanMin_taw_R70000_V10_S40 = round(mean(taw_R70000_V10(4,:))/60);
MeanMin_taw_R70000_V10_S50 = round(mean(taw_R70000_V10(5,:))/60);
MeanMin_taw_R70000_V10_S60 = round(mean(taw_R70000_V10(6,:))/60);
MeanMin_taw_R70000_V10_S70 = round(mean(taw_R70000_V10(7,:))/60);
MeanMin_taw_R70000_V10_S80 = round(mean(taw_R70000_V10(8,:))/60);
MeanMin_taw_R70000_V10_S90 = round(mean(taw_R70000_V10(9,:))/60);

Mean_taw_R70000_V20_S10 = mean(taw_R70000_V20(1,:));
Mean_taw_R70000_V20_S20 = mean(taw_R70000_V20(2,:));
Mean_taw_R70000_V20_S30 = mean(taw_R70000_V20(3,:));
Mean_taw_R70000_V20_S40 = mean(taw_R70000_V20(4,:));
Mean_taw_R70000_V20_S50 = mean(taw_R70000_V20(5,:));
Mean_taw_R70000_V20_S60 = mean(taw_R70000_V20(6,:));
Mean_taw_R70000_V20_S70 = mean(taw_R70000_V20(7,:));
Mean_taw_R70000_V20_S80 = mean(taw_R70000_V20(8,:));
Mean_taw_R70000_V20_S90 = mean(taw_R70000_V20(9,:));

MeanMin_taw_R70000_V20_S10 = round(mean(taw_R70000_V20(1,:))/60);
MeanMin_taw_R70000_V20_S20 = round(mean(taw_R70000_V20(2,:))/60);
MeanMin_taw_R70000_V20_S30 = round(mean(taw_R70000_V20(3,:))/60);
MeanMin_taw_R70000_V20_S40 = round(mean(taw_R70000_V20(4,:))/60);
MeanMin_taw_R70000_V20_S50 = round(mean(taw_R70000_V20(5,:))/60);
MeanMin_taw_R70000_V20_S60 = round(mean(taw_R70000_V20(6,:))/60);
MeanMin_taw_R70000_V20_S70 = round(mean(taw_R70000_V20(7,:))/60);
MeanMin_taw_R70000_V20_S80 = round(mean(taw_R70000_V20(8,:))/60);
MeanMin_taw_R70000_V20_S90 = round(mean(taw_R70000_V20(9,:))/60);

%% Monte Carlo Range 80000
i = 1;
taw_R80000_V5 = [];
taw_R80000_V10 = [];
taw_R80000_V20 = [];

for Desired_Time_Saving = 0.1:0.1:0.9
    
    j = 1;
    
    for montecounter = 1:1:Number_of_Simulations
        
        t_O = 2*pi*rand;
        r_O = 5000*sqrt(rand);
        X_O = 0 + r_O*cos(t_O); % Random X Location Inside a Circle
        Y_O = 0 + r_O*sin(t_O); % Random Y Location Inside a Circle
        t_D = 2*pi*rand;
        r_D = 5000*sqrt(rand);
        X_D = 80000 + r_D*cos(t_D);
        Y_D = 0 + r_D*sin(t_D);
    
        Distance = sqrt((X_D - X_O)^2 + (Y_D - Y_O)^2);
    
        taw_R80000_V5(i,j) = (1-Desired_Time_Saving)*((Distance*Routing_Factor)/(AVG_Speed_Taxi(1,1))) - UAM_Time(1,1);
        taw_R80000_V10(i,j) = (1-Desired_Time_Saving)*((Distance*Routing_Factor)/(AVG_Speed_Taxi(1,2))) - UAM_Time(1,1);
        taw_R80000_V20(i,j) = (1-Desired_Time_Saving)*((Distance*Routing_Factor)/(AVG_Speed_Taxi(1,3))) - UAM_Time(1,1);
        
        j = j + 1;
    end
    
    i = i + 1;
    
end
Mean_taw_R80000_V5_S10 = mean(taw_R80000_V5(1,:));
Mean_taw_R80000_V5_S20 = mean(taw_R80000_V5(2,:));
Mean_taw_R80000_V5_S30 = mean(taw_R80000_V5(3,:));
Mean_taw_R80000_V5_S40 = mean(taw_R80000_V5(4,:));
Mean_taw_R80000_V5_S50 = mean(taw_R80000_V5(5,:));
Mean_taw_R80000_V5_S60 = mean(taw_R80000_V5(6,:));
Mean_taw_R80000_V5_S70 = mean(taw_R80000_V5(7,:));
Mean_taw_R80000_V5_S80 = mean(taw_R80000_V5(8,:));
Mean_taw_R80000_V5_S90 = mean(taw_R80000_V5(9,:));

MeanMin_taw_R80000_V5_S10 = round(mean(taw_R80000_V5(1,:))/60);
MeanMin_taw_R80000_V5_S20 = round(mean(taw_R80000_V5(2,:))/60);
MeanMin_taw_R80000_V5_S30 = round(mean(taw_R80000_V5(3,:))/60);
MeanMin_taw_R80000_V5_S40 = round(mean(taw_R80000_V5(4,:))/60);
MeanMin_taw_R80000_V5_S50 = round(mean(taw_R80000_V5(5,:))/60);
MeanMin_taw_R80000_V5_S60 = round(mean(taw_R80000_V5(6,:))/60);
MeanMin_taw_R80000_V5_S70 = round(mean(taw_R80000_V5(7,:))/60);
MeanMin_taw_R80000_V5_S80 = round(mean(taw_R80000_V5(8,:))/60);
MeanMin_taw_R80000_V5_S90 = round(mean(taw_R80000_V5(9,:))/60);

Mean_taw_R80000_V10_S10 = mean(taw_R80000_V10(1,:));
Mean_taw_R80000_V10_S20 = mean(taw_R80000_V10(2,:));
Mean_taw_R80000_V10_S30 = mean(taw_R80000_V10(3,:));
Mean_taw_R80000_V10_S40 = mean(taw_R80000_V10(4,:));
Mean_taw_R80000_V10_S50 = mean(taw_R80000_V10(5,:));
Mean_taw_R80000_V10_S60 = mean(taw_R80000_V10(6,:));
Mean_taw_R80000_V10_S70 = mean(taw_R80000_V10(7,:));
Mean_taw_R80000_V10_S80 = mean(taw_R80000_V10(8,:));
Mean_taw_R80000_V10_S90 = mean(taw_R80000_V10(9,:));

MeanMin_taw_R80000_V10_S10 = round(mean(taw_R80000_V10(1,:))/60);
MeanMin_taw_R80000_V10_S20 = round(mean(taw_R80000_V10(2,:))/60);
MeanMin_taw_R80000_V10_S30 = round(mean(taw_R80000_V10(3,:))/60);
MeanMin_taw_R80000_V10_S40 = round(mean(taw_R80000_V10(4,:))/60);
MeanMin_taw_R80000_V10_S50 = round(mean(taw_R80000_V10(5,:))/60);
MeanMin_taw_R80000_V10_S60 = round(mean(taw_R80000_V10(6,:))/60);
MeanMin_taw_R80000_V10_S70 = round(mean(taw_R80000_V10(7,:))/60);
MeanMin_taw_R80000_V10_S80 = round(mean(taw_R80000_V10(8,:))/60);
MeanMin_taw_R80000_V10_S90 = round(mean(taw_R80000_V10(9,:))/60);

Mean_taw_R80000_V20_S10 = mean(taw_R80000_V20(1,:));
Mean_taw_R80000_V20_S20 = mean(taw_R80000_V20(2,:));
Mean_taw_R80000_V20_S30 = mean(taw_R80000_V20(3,:));
Mean_taw_R80000_V20_S40 = mean(taw_R80000_V20(4,:));
Mean_taw_R80000_V20_S50 = mean(taw_R80000_V20(5,:));
Mean_taw_R80000_V20_S60 = mean(taw_R80000_V20(6,:));
Mean_taw_R80000_V20_S70 = mean(taw_R80000_V20(7,:));
Mean_taw_R80000_V20_S80 = mean(taw_R80000_V20(8,:));
Mean_taw_R80000_V20_S90 = mean(taw_R80000_V20(9,:));

MeanMin_taw_R80000_V20_S10 = round(mean(taw_R80000_V20(1,:))/60);
MeanMin_taw_R80000_V20_S20 = round(mean(taw_R80000_V20(2,:))/60);
MeanMin_taw_R80000_V20_S30 = round(mean(taw_R80000_V20(3,:))/60);
MeanMin_taw_R80000_V20_S40 = round(mean(taw_R80000_V20(4,:))/60);
MeanMin_taw_R80000_V20_S50 = round(mean(taw_R80000_V20(5,:))/60);
MeanMin_taw_R80000_V20_S60 = round(mean(taw_R80000_V20(6,:))/60);
MeanMin_taw_R80000_V20_S70 = round(mean(taw_R80000_V20(7,:))/60);
MeanMin_taw_R80000_V20_S80 = round(mean(taw_R80000_V20(8,:))/60);
MeanMin_taw_R80000_V20_S90 = round(mean(taw_R80000_V20(9,:))/60);

%% Plot Time Saving V = 5m/s
RangE = [10000:10000:80000];
MeanMin_taw_V5_S10 = [MeanMin_taw_R10000_V5_S10, MeanMin_taw_R20000_V5_S10, MeanMin_taw_R30000_V5_S10, MeanMin_taw_R40000_V5_S10, MeanMin_taw_R50000_V5_S10, MeanMin_taw_R60000_V5_S10, MeanMin_taw_R70000_V5_S10, MeanMin_taw_R80000_V5_S10];
MeanMin_taw_V5_S20 = [MeanMin_taw_R10000_V5_S20, MeanMin_taw_R20000_V5_S20, MeanMin_taw_R30000_V5_S20, MeanMin_taw_R40000_V5_S20, MeanMin_taw_R50000_V5_S20, MeanMin_taw_R60000_V5_S20, MeanMin_taw_R70000_V5_S20, MeanMin_taw_R80000_V5_S20];
MeanMin_taw_V5_S30 = [MeanMin_taw_R10000_V5_S30, MeanMin_taw_R20000_V5_S30, MeanMin_taw_R30000_V5_S30, MeanMin_taw_R40000_V5_S30, MeanMin_taw_R50000_V5_S30, MeanMin_taw_R60000_V5_S30, MeanMin_taw_R70000_V5_S30, MeanMin_taw_R80000_V5_S30];
MeanMin_taw_V5_S40 = [MeanMin_taw_R10000_V5_S40, MeanMin_taw_R20000_V5_S40, MeanMin_taw_R30000_V5_S40, MeanMin_taw_R40000_V5_S40, MeanMin_taw_R50000_V5_S40, MeanMin_taw_R60000_V5_S40, MeanMin_taw_R70000_V5_S40, MeanMin_taw_R80000_V5_S40];
MeanMin_taw_V5_S50 = [MeanMin_taw_R10000_V5_S50, MeanMin_taw_R20000_V5_S50, MeanMin_taw_R30000_V5_S50, MeanMin_taw_R40000_V5_S50, MeanMin_taw_R50000_V5_S50, MeanMin_taw_R60000_V5_S50, MeanMin_taw_R70000_V5_S50, MeanMin_taw_R80000_V5_S50];
MeanMin_taw_V5_S60 = [MeanMin_taw_R10000_V5_S60, MeanMin_taw_R20000_V5_S60, MeanMin_taw_R30000_V5_S60, MeanMin_taw_R40000_V5_S60, MeanMin_taw_R50000_V5_S60, MeanMin_taw_R60000_V5_S60, MeanMin_taw_R70000_V5_S60, MeanMin_taw_R80000_V5_S60];
MeanMin_taw_V5_S70 = [MeanMin_taw_R10000_V5_S70, MeanMin_taw_R20000_V5_S70, MeanMin_taw_R30000_V5_S70, MeanMin_taw_R40000_V5_S70, MeanMin_taw_R50000_V5_S70, MeanMin_taw_R60000_V5_S70, MeanMin_taw_R70000_V5_S70, MeanMin_taw_R80000_V5_S70];
MeanMin_taw_V5_S80 = [MeanMin_taw_R10000_V5_S80, MeanMin_taw_R20000_V5_S80, MeanMin_taw_R30000_V5_S80, MeanMin_taw_R40000_V5_S80, MeanMin_taw_R50000_V5_S80, MeanMin_taw_R60000_V5_S80, MeanMin_taw_R70000_V5_S80, MeanMin_taw_R80000_V5_S80];
MeanMin_taw_V5_S90 = [MeanMin_taw_R10000_V5_S90, MeanMin_taw_R20000_V5_S90, MeanMin_taw_R30000_V5_S90, MeanMin_taw_R40000_V5_S90, MeanMin_taw_R50000_V5_S90, MeanMin_taw_R60000_V5_S90, MeanMin_taw_R70000_V5_S90, MeanMin_taw_R80000_V5_S90];


figure('Name','Travel Time Saving V5')
plot(RangE,MeanMin_taw_V5_S10,'-k*')
hold on
plot(RangE,MeanMin_taw_V5_S20,'--k*')
hold on
plot(RangE,MeanMin_taw_V5_S30,'-b*')
hold on
plot(RangE,MeanMin_taw_V5_S40,'--b*')
hold on
plot(RangE,MeanMin_taw_V5_S50,'-r*')
hold on
plot(RangE,MeanMin_taw_V5_S60,'--r*')
hold on
plot(RangE,MeanMin_taw_V5_S70,'-g*')
hold on
plot(RangE,MeanMin_taw_V5_S80,'--g*')
hold on
plot(RangE,MeanMin_taw_V5_S90,'-m*')
grid on
title('\it Travel Time Saving Case of Average Taxi Speed of 5 m/s')
xlabel('\it Range (m)')
ylabel('\it UAM Non-flight Time (min)')
legend('TTS = 10%','TTS = 20%','TTS = 30%','TTS = 40%','TTS = 50%','TTS = 60%','TTS = 70%','TTS = 80%','TTS = 90%','Location','southeast','NumColumns',4,'FontSize',8)

%% Plot Time Saving V = 10 m/s
MeanMin_taw_V10_S10 = [MeanMin_taw_R10000_V10_S10, MeanMin_taw_R20000_V10_S10, MeanMin_taw_R30000_V10_S10, MeanMin_taw_R40000_V10_S10, MeanMin_taw_R50000_V10_S10, MeanMin_taw_R60000_V10_S10, MeanMin_taw_R70000_V10_S10, MeanMin_taw_R80000_V10_S10];
MeanMin_taw_V10_S20 = [MeanMin_taw_R10000_V10_S20, MeanMin_taw_R20000_V10_S20, MeanMin_taw_R30000_V10_S20, MeanMin_taw_R40000_V10_S20, MeanMin_taw_R50000_V10_S20, MeanMin_taw_R60000_V10_S20, MeanMin_taw_R70000_V10_S20, MeanMin_taw_R80000_V10_S20];
MeanMin_taw_V10_S30 = [MeanMin_taw_R10000_V10_S30, MeanMin_taw_R20000_V10_S30, MeanMin_taw_R30000_V10_S30, MeanMin_taw_R40000_V10_S30, MeanMin_taw_R50000_V10_S30, MeanMin_taw_R60000_V10_S30, MeanMin_taw_R70000_V10_S30, MeanMin_taw_R80000_V10_S30];
MeanMin_taw_V10_S40 = [MeanMin_taw_R10000_V10_S40, MeanMin_taw_R20000_V10_S40, MeanMin_taw_R30000_V10_S40, MeanMin_taw_R40000_V10_S40, MeanMin_taw_R50000_V10_S40, MeanMin_taw_R60000_V10_S40, MeanMin_taw_R70000_V10_S40, MeanMin_taw_R80000_V10_S40];
MeanMin_taw_V10_S50 = [MeanMin_taw_R10000_V10_S50, MeanMin_taw_R20000_V10_S50, MeanMin_taw_R30000_V10_S50, MeanMin_taw_R40000_V10_S50, MeanMin_taw_R50000_V10_S50, MeanMin_taw_R60000_V10_S50, MeanMin_taw_R70000_V10_S50, MeanMin_taw_R80000_V10_S50];
MeanMin_taw_V10_S60 = [MeanMin_taw_R10000_V10_S60, MeanMin_taw_R20000_V10_S60, MeanMin_taw_R30000_V10_S60, MeanMin_taw_R40000_V10_S60, MeanMin_taw_R50000_V10_S60, MeanMin_taw_R60000_V10_S60, MeanMin_taw_R70000_V10_S60, MeanMin_taw_R80000_V10_S60];
MeanMin_taw_V10_S70 = [MeanMin_taw_R10000_V10_S70, MeanMin_taw_R20000_V10_S70, MeanMin_taw_R30000_V10_S70, MeanMin_taw_R40000_V10_S70, MeanMin_taw_R50000_V10_S70, MeanMin_taw_R60000_V10_S70, MeanMin_taw_R70000_V10_S70, MeanMin_taw_R80000_V10_S70];
MeanMin_taw_V10_S80 = [MeanMin_taw_R10000_V10_S80, MeanMin_taw_R20000_V10_S80, MeanMin_taw_R30000_V10_S80, MeanMin_taw_R40000_V10_S80, MeanMin_taw_R50000_V10_S80, MeanMin_taw_R60000_V10_S80, MeanMin_taw_R70000_V10_S80, MeanMin_taw_R80000_V10_S80];
MeanMin_taw_V10_S90 = [MeanMin_taw_R10000_V10_S90, MeanMin_taw_R20000_V10_S90, MeanMin_taw_R30000_V10_S90, MeanMin_taw_R40000_V10_S90, MeanMin_taw_R50000_V10_S90, MeanMin_taw_R60000_V10_S90, MeanMin_taw_R70000_V10_S90, MeanMin_taw_R80000_V10_S90];


figure('Name','Travel Time Saving V10')
plot(RangE,MeanMin_taw_V10_S10,'-k*')
hold on
plot(RangE,MeanMin_taw_V10_S20,'--k*')
hold on
plot(RangE,MeanMin_taw_V10_S30,'-b*')
hold on
plot(RangE,MeanMin_taw_V10_S40,'--b*')
hold on
plot(RangE,MeanMin_taw_V10_S50,'-r*')
hold on
plot(RangE,MeanMin_taw_V10_S60,'--r*')
hold on
plot(RangE,MeanMin_taw_V10_S70,'-g*')
hold on
plot(RangE,MeanMin_taw_V10_S80,'--g*')
hold on
plot(RangE,MeanMin_taw_V10_S90,'-m*')
grid on
title('\it Travel Time Saving Case of Average Taxi Speed of 10 m/s')
xlabel('\it Range (m)')
ylabel('\it UAM Non-flight Time (min)')
legend('TTS = 10%','TTS = 20%','TTS = 30%','TTS = 40%','TTS = 50%','TTS = 60%','TTS = 70%','TTS = 80%','TTS = 90%','Location','southeast','NumColumns',4,'FontSize',8)


%% Plot Time Saving V = 20m/s
MeanMin_taw_V20_S10 = [MeanMin_taw_R10000_V20_S10, MeanMin_taw_R20000_V20_S10, MeanMin_taw_R30000_V20_S10, MeanMin_taw_R40000_V20_S10, MeanMin_taw_R50000_V20_S10, MeanMin_taw_R60000_V20_S10, MeanMin_taw_R70000_V20_S10, MeanMin_taw_R80000_V20_S10];
MeanMin_taw_V20_S20 = [MeanMin_taw_R10000_V20_S20, MeanMin_taw_R20000_V20_S20, MeanMin_taw_R30000_V20_S20, MeanMin_taw_R40000_V20_S20, MeanMin_taw_R50000_V20_S20, MeanMin_taw_R60000_V20_S20, MeanMin_taw_R70000_V20_S20, MeanMin_taw_R80000_V20_S20];
MeanMin_taw_V20_S30 = [MeanMin_taw_R10000_V20_S30, MeanMin_taw_R20000_V20_S30, MeanMin_taw_R30000_V20_S30, MeanMin_taw_R40000_V20_S30, MeanMin_taw_R50000_V20_S30, MeanMin_taw_R60000_V20_S30, MeanMin_taw_R70000_V20_S30, MeanMin_taw_R80000_V20_S30];
MeanMin_taw_V20_S40 = [MeanMin_taw_R10000_V20_S40, MeanMin_taw_R20000_V20_S40, MeanMin_taw_R30000_V20_S40, MeanMin_taw_R40000_V20_S40, MeanMin_taw_R50000_V20_S40, MeanMin_taw_R60000_V20_S40, MeanMin_taw_R70000_V20_S40, MeanMin_taw_R80000_V20_S40];
MeanMin_taw_V20_S50 = [MeanMin_taw_R10000_V20_S50, MeanMin_taw_R20000_V20_S50, MeanMin_taw_R30000_V20_S50, MeanMin_taw_R40000_V20_S50, MeanMin_taw_R50000_V20_S50, MeanMin_taw_R60000_V20_S50, MeanMin_taw_R70000_V20_S50, MeanMin_taw_R80000_V20_S50];
MeanMin_taw_V20_S60 = [MeanMin_taw_R10000_V20_S60, MeanMin_taw_R20000_V20_S60, MeanMin_taw_R30000_V20_S60, MeanMin_taw_R40000_V20_S60, MeanMin_taw_R50000_V20_S60, MeanMin_taw_R60000_V20_S60, MeanMin_taw_R70000_V20_S60, MeanMin_taw_R80000_V20_S60];
MeanMin_taw_V20_S70 = [MeanMin_taw_R10000_V20_S70, MeanMin_taw_R20000_V20_S70, MeanMin_taw_R30000_V20_S70, MeanMin_taw_R40000_V20_S70, MeanMin_taw_R50000_V20_S70, MeanMin_taw_R60000_V20_S70, MeanMin_taw_R70000_V20_S70, MeanMin_taw_R80000_V20_S70];
MeanMin_taw_V20_S80 = [MeanMin_taw_R10000_V20_S80, MeanMin_taw_R20000_V20_S80, MeanMin_taw_R30000_V20_S80, MeanMin_taw_R40000_V20_S80, MeanMin_taw_R50000_V20_S80, MeanMin_taw_R60000_V20_S80, MeanMin_taw_R70000_V20_S80, MeanMin_taw_R80000_V20_S80];
MeanMin_taw_V20_S90 = [MeanMin_taw_R10000_V20_S90, MeanMin_taw_R20000_V20_S90, MeanMin_taw_R30000_V20_S90, MeanMin_taw_R40000_V20_S90, MeanMin_taw_R50000_V20_S90, MeanMin_taw_R60000_V20_S90, MeanMin_taw_R70000_V20_S90, MeanMin_taw_R80000_V20_S90];


figure('Name','Travel Time Saving V20')
plot(RangE,MeanMin_taw_V20_S10,'-k*')
hold on
plot(RangE,MeanMin_taw_V20_S20,'--k*')
hold on
plot(RangE,MeanMin_taw_V20_S30,'-b*')
hold on
plot(RangE,MeanMin_taw_V20_S40,'--b*')
hold on
plot(RangE,MeanMin_taw_V20_S50,'-r*')
hold on
plot(RangE,MeanMin_taw_V20_S60,'--r*')
hold on
plot(RangE,MeanMin_taw_V20_S70,'-g*')
hold on
plot(RangE,MeanMin_taw_V20_S80,'--g*')
hold on
plot(RangE,MeanMin_taw_V20_S90,'-m*')
grid on
title('\it Travel Time Saving Case of Average Taxi Speed of 20 m/s')
xlabel('\it Range (m)')
ylabel('\it UAM Non-flight Time (min)')
legend('TTS = 10%','TTS = 20%','TTS = 30%','TTS = 40%','TTS = 50%','TTS = 60%','TTS = 70%','TTS = 80%','TTS = 90%','Location','southeast','NumColumns',4,'FontSize',8)
