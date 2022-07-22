%% Number of Trips
clc
clear

%% 4 Passengers
X0 = 0;
Y0 = 0;
Yd = 0;
Number_of_Passenger = 4;
E_4PAX = [];
h = [];
j = 1;
h = [150:150:1050];
Range = [10000:1000:100000];
for h0 = 150:150:1050
    
    i = 1;
    for Xd = 10000:1000:100000
        
        [Total_E, Total_T] = flight(X0,Y0,Xd,Yd,h0,Number_of_Passenger);
        E_4PAX(j,i) = Total_E;
        i = i+1;
        
    end
    
    max_Range_4PAX(1,j) = Range(find(E_4PAX(j,:) > 339000000,1));
    j = j+1;
    
end

%% 3 Passengers
X0 = 0;
Y0 = 0;
Yd = 0;
Number_of_Passenger = 3;
E_3PAX = [];
h = [];
j = 1;
h = [150:150:1050];
Range = [10000:1000:100000];
for h0 = 150:150:1050
    
    i = 1;
    for Xd = 10000:1000:100000
        
        [Total_E, Total_T] = flight(X0,Y0,Xd,Yd,h0,Number_of_Passenger);
        E_3PAX(j,i) = Total_E;
        i = i+1;
        
    end
    
    max_Range_3PAX(1,j) = Range(find(E_3PAX(j,:) > 339000000,1));
    j = j+1;
    
end

%% 2 Passengers
X0 = 0;
Y0 = 0;
Yd = 0;
Number_of_Passenger = 2;
E_2PAX = [];
h = [];
j = 1;
h = [150:150:1050];
Range = [10000:1000:100000];
for h0 = 150:150:1050
    
    i = 1;
    for Xd = 10000:1000:100000
        
        [Total_E, Total_T] = flight(X0,Y0,Xd,Yd,h0,Number_of_Passenger);
        E_2PAX(j,i) = Total_E;
        i = i+1;
        
    end
    
    max_Range_2PAX(1,j) = Range(find(E_2PAX(j,:) > 339000000,1));
    j = j+1;
    
end

%% 1 Passengers
X0 = 0;
Y0 = 0;
Yd = 0;
Number_of_Passenger = 1;
E_1PAX = [];
h = [];
j = 1;
h = [150:150:1050];
Range = [10000:1000:100000];
for h0 = 150:150:1050
    
    i = 1;
    for Xd = 10000:1000:100000
        
        [Total_E, Total_T] = flight(X0,Y0,Xd,Yd,h0,Number_of_Passenger);
        E_1PAX(j,i) = Total_E;
        i = i+1;
        
    end
    
    max_Range_1PAX(1,j) = Range(find(E_1PAX(j,:) > 339000000,1));
    j = j+1;
    
end

%% Number of Trips 4 PAX
p = 1;
for p = 1:7
    
   q = 1;
   for q = 1:72
       
       Nnumber_of_Trips_4PAX(p,q) = round(339000000/E_4PAX(p,q));
       
   end
   
end

%% Number of Trips 3 PAX
p = 1;
for p = 1:7
    
   q = 1;
   for q = 1:72
       
       Nnumber_of_Trips_3PAX(p,q) = round(339000000/E_3PAX(p,q));
       
   end
   
end

%% Number of Trips 2 PAX
p = 1;
for p = 1:7
    
   q = 1;
   for q = 1:72
       
       Nnumber_of_Trips_2PAX(p,q) = round(339000000/E_2PAX(p,q));
       
   end
   
end

%% Number of Trips 1 PAX
p = 1;
for p = 1:7
    
   q = 1;
   for q = 1:72
       
       Nnumber_of_Trips_1PAX(p,q) = round(339000000/E_1PAX(p,q));
       
   end
   
end

%% Plot Number of Trips 4 PAX
RangE = [10000:1000:81000];
figure('Name','Number of Trips 4 PAX')
plot(RangE,Nnumber_of_Trips_4PAX(1,:),'k')
hold on
plot(RangE,Nnumber_of_Trips_4PAX(2,:),'c')
hold on
plot(RangE,Nnumber_of_Trips_4PAX(3,:),'r')
hold on
plot(RangE,Nnumber_of_Trips_4PAX(4,:),'m')
hold on
plot(RangE,Nnumber_of_Trips_4PAX(5,:),'y')
hold on
plot(RangE,Nnumber_of_Trips_4PAX(6,:),'b')
hold on
plot(RangE,Nnumber_of_Trips_4PAX(7,:),'g')
grid on
title('\it Number of Trips Without Charging vs Range Case of Four Passengers')
xlabel('\it Range (m)')
ylabel('\it Number of Trips Without Charging')
legend('Altitude = 150m','Altitude = 300m','Altitude = 450m','Altitude = 600m','Altitude = 750m','Altitude = 900m','Altitude = 1050m','Location','southeast','NumColumns',4,'FontSize',8)

%% Plot Number of Trips 3 PAX
RangE = [10000:1000:81000];
figure('Name','Number of Trips 3 PAX')
plot(RangE,Nnumber_of_Trips_3PAX(1,:),'k')
hold on
plot(RangE,Nnumber_of_Trips_3PAX(2,:),'c')
hold on
plot(RangE,Nnumber_of_Trips_3PAX(3,:),'r')
hold on
plot(RangE,Nnumber_of_Trips_3PAX(4,:),'m')
hold on
plot(RangE,Nnumber_of_Trips_3PAX(5,:),'y')
hold on
plot(RangE,Nnumber_of_Trips_3PAX(6,:),'b')
hold on
plot(RangE,Nnumber_of_Trips_3PAX(7,:),'g')
grid on
title('\it Number of Trips Without Charging vs Range Case of Three Passengers')
xlabel('\it Range (m)')
ylabel('\it Number of Trips Without Charging')
legend('Altitude = 150m','Altitude = 300m','Altitude = 450m','Altitude = 600m','Altitude = 750m','Altitude = 900m','Altitude = 1050m','Location','southeast','NumColumns',4,'FontSize',8)

%% Plot Number of Trips 2 PAX
RangE = [10000:1000:81000];
figure('Name','Number of Trips 2 PAX')
plot(RangE,Nnumber_of_Trips_2PAX(1,:),'k')
hold on
plot(RangE,Nnumber_of_Trips_2PAX(2,:),'c')
hold on
plot(RangE,Nnumber_of_Trips_2PAX(3,:),'r')
hold on
plot(RangE,Nnumber_of_Trips_2PAX(4,:),'m')
hold on
plot(RangE,Nnumber_of_Trips_2PAX(5,:),'y')
hold on
plot(RangE,Nnumber_of_Trips_2PAX(6,:),'b')
hold on
plot(RangE,Nnumber_of_Trips_2PAX(7,:),'g')
grid on
title('\it Number of Trips Without Charging vs Range Case of Two Passengers')
xlabel('\it Range (m)')
ylabel('\it Number of Trips Without Charging')
legend('Altitude = 150m','Altitude = 300m','Altitude = 450m','Altitude = 600m','Altitude = 750m','Altitude = 900m','Altitude = 1050m','Location','southeast','NumColumns',4,'FontSize',8)

%% Plot Number of Trips 1 PAX
RangE = [10000:1000:81000];
figure('Name','Number of Trips 1 PAX')
plot(RangE,Nnumber_of_Trips_1PAX(1,:),'k')
hold on
plot(RangE,Nnumber_of_Trips_1PAX(2,:),'c')
hold on
plot(RangE,Nnumber_of_Trips_1PAX(3,:),'r')
hold on
plot(RangE,Nnumber_of_Trips_1PAX(4,:),'m')
hold on
plot(RangE,Nnumber_of_Trips_1PAX(5,:),'y')
hold on
plot(RangE,Nnumber_of_Trips_1PAX(6,:),'b')
hold on
plot(RangE,Nnumber_of_Trips_1PAX(7,:),'g')
grid on
title('\it Number of Trips Without Charging vs Range Case of One Passenger')
xlabel('\it Range (m)')
ylabel('\it Number of Trips Without Charging')
legend('Altitude = 150m','Altitude = 300m','Altitude = 450m','Altitude = 600m','Altitude = 750m','Altitude = 900m','Altitude = 1050m','Location','southeast','NumColumns',4,'FontSize',8)
