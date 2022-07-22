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
Range = [10000:1000:170000];
Battery_Tecnology_Rate = [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];
for h0 = 150:10:1050
    
    i = 1;
    for Xd = 10000:1000:170000
        
        [Total_E, Total_T] = flight(X0,Y0,Xd,Yd,h0,Number_of_Passenger);
        E_4PAX(j,i) = Total_E;
        i = i+1;
        
    end
    
    max_Range_4PAX_Current(1,j) = Range(find(E_4PAX(j,:) > 339000000,1));
    max_Range_4PAX_10Percent(1,j) = Range(find(E_4PAX(j,:) > (339000000 + Battery_Tecnology_Rate(1,1)*339000000),1));
    max_Range_4PAX_20Percent(1,j) = Range(find(E_4PAX(j,:) > (339000000 + Battery_Tecnology_Rate(1,2)*339000000),1));
    max_Range_4PAX_30Percent(1,j) = Range(find(E_4PAX(j,:) > (339000000 + Battery_Tecnology_Rate(1,3)*339000000),1));
    max_Range_4PAX_40Percent(1,j) = Range(find(E_4PAX(j,:) > (339000000 + Battery_Tecnology_Rate(1,4)*339000000),1));
    max_Range_4PAX_50Percent(1,j) = Range(find(E_4PAX(j,:) > (339000000 + Battery_Tecnology_Rate(1,5)*339000000),1));
    max_Range_4PAX_60Percent(1,j) = Range(find(E_4PAX(j,:) > (339000000 + Battery_Tecnology_Rate(1,6)*339000000),1));
    max_Range_4PAX_70Percent(1,j) = Range(find(E_4PAX(j,:) > (339000000 + Battery_Tecnology_Rate(1,7)*339000000),1));
    max_Range_4PAX_80Percent(1,j) = Range(find(E_4PAX(j,:) > (339000000 + Battery_Tecnology_Rate(1,8)*339000000),1));
    max_Range_4PAX_90Percent(1,j) = Range(find(E_4PAX(j,:) > (339000000 + Battery_Tecnology_Rate(1,9)*339000000),1));
    max_Range_4PAX_100Percent(1,j) = Range(find(E_4PAX(j,:) > (339000000 + Battery_Tecnology_Rate(1,10)*339000000),1));
    j = j+1;
    
end

%% Plot Maximum Range
figure('Name','Battery Technology')
plot(h,max_Range_4PAX_Current,'-k')
hold on
plot(h,max_Range_4PAX_10Percent,'--k')
hold on
plot(h,max_Range_4PAX_20Percent,'-b')
hold on
plot(h,max_Range_4PAX_30Percent,'--b')
hold on
plot(h,max_Range_4PAX_40Percent,'-g')
hold on
plot(h,max_Range_4PAX_50Percent,'--g')
hold on
plot(h,max_Range_4PAX_60Percent,'-r')
hold on
plot(h,max_Range_4PAX_70Percent,'--r')
hold on
plot(h,max_Range_4PAX_80Percent,'-m')
hold on
plot(h,max_Range_4PAX_90Percent,'--m')
hold on
plot(h,max_Range_4PAX_100Percent,'-c')
grid on
title('\it Battery Technology Impact on Maximum Range Case of Full Pax')
xlabel('\it Altitude (m)')
ylabel('\it Maximum Range (m)')
legend('Current Technology','10% Improvement','20% Improvement','30% Improvement','40% Improvement','50% Improvement','60% Improvement','70% Improvement','80% Improvement','90% Improvement','100% Improvement','Location','southeast','NumColumns',4,'FontSize',8)
