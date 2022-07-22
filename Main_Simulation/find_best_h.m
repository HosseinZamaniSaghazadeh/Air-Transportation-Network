%% Finding the Altitude at Which the Energy Consumption of the EVTOL is Minimum Due to Range
function h_best = find_best_h(Range,Number_of_Passenger)
Xd = Range;
Yd = 0;
E = []; T = []; h = [];
for h0 = 150:150:1050
    X0 = 0;
    Y0 = 0;
    [Total_E, Total_T] = flight(X0,Y0,Xd,Yd,h0,Number_of_Passenger);
    E = [E;Total_E]; T = [T;Total_T]; h = [h;h0];
end
[~,index] = min(E);
h_best = h(index);