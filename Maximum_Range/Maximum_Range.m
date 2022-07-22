%% Maximum Range
clc
clear

%% 4 Passengers
X0 = 0;
Y0 = 0;
Yd = 0;
Number_of_Passenger = 4;
E_4PAX = [];
j = 1;
h = [150:10:1050];
Range = [10000:1000:100000];
for h0 = 150:10:1050
    
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
j = 1;
Range = [10000:1000:100000];
for h0 = 150:10:1050
    
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
j = 1;
Range = [10000:1000:100000];
for h0 = 150:10:1050
    
    i = 1;
    for Xd = 10000:1000:100000
        
        [Total_E, Total_T] = flight(X0,Y0,Xd,Yd,h0,Number_of_Passenger);
        E_2PAX(j,i) = Total_E;
        i = i+1;
        
    end
    
    max_Range_2PAX(1,j) = Range(find(E_2PAX(j,:) > 339000000,1));
    j = j+1;
    
end

%% 1 Passenger
X0 = 0;
Y0 = 0;
Yd = 0;
Number_of_Passenger = 1;
E_1PAX = [];
j = 1;
Range = [10000:1000:100000];
for h0 = 150:10:1050
    
    i = 1;
    for Xd = 10000:1000:100000
        
        [Total_E, Total_T] = flight(X0,Y0,Xd,Yd,h0,Number_of_Passenger);
        E_1PAX(j,i) = Total_E;
        i = i+1;
        
    end
    
    max_Range_1PAX(1,j) = Range(find(E_1PAX(j,:) > 339000000,1));
    j = j+1;
    
end

%% Plot Maximum Range
figure('Name','Maximum Range')
plot(h,max_Range_4PAX,'-k')
hold on
plot(h,max_Range_3PAX,'-b')
hold on
plot(h,max_Range_2PAX,'-g')
hold on
plot(h,max_Range_1PAX,'-r')
grid on
title('\it Maximum Allowable Distance Between Stations in the Network')
xlabel('\it Altitude (m)')
ylabel('\it Maximum Range (m)')
legend('Case of 4 Passengers','Case of 3 Passengers','Case of 2 Passengers','Caseof 1 Passenger','Location','southeast','NumColumns',4,'FontSize',8)
