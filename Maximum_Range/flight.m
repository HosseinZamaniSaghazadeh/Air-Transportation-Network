%% Simulation of All Phases of the EVTOL Flight
function [Total_E, Total_T] = flight(X0, Y0, Xd, Yd, h0, Number_of_Passenger)
%% Spricho_Parrameters
Power_Compensation = 6.8;
Number_of_Motors = 4;
Max_RPM = 3000;
Max_Tn = 32000;%N
g = 9.8;%m/s2
Mass_Empty = 1620;%Kg
Passenger_Mass = 90;
Mass = Mass_Empty + Number_of_Passenger*Passenger_Mass;
Weight = Mass*g;
Alpha0 = alpha_init(Number_of_Passenger);
Alpha = Alpha0;
Toffset = 0;
Gamma0 = 0;
S_Wing = 2*8.194;
CLmax = 1.8;
CDCL2 = 0.0833074579612907;
CDCL = -0.0383242973320441;
CD0 = 0.03;
CLalpha = 3.002863026926921;
CL0 = 0.3115980645521940;
Psi = atan((Yd-Y0)/(Xd-X0));
V0 = 60;%m/s
T0 = 2000;%N

%% Energy and Time Calculator
[E_climb, T_climb] = Climb(Weight,h0,Max_Tn,Max_RPM,Number_of_Motors,Power_Compensation);

assignin('base','Xd',Xd)
assignin('base','Yd',Yd)
assignin('base','X0',X0)
assignin('base','Y0',Y0)
assignin('base','h0',h0)
assignin('base','Power_Compensation',Power_Compensation)
assignin('base','Number_of_Motors',Number_of_Motors)
assignin('base','Max_RPM',Max_RPM)
assignin('base','Max_Tn',Max_Tn)
assignin('base','g',g)
assignin('base','Mass',Mass)
assignin('base','Alpha',Alpha)
assignin('base','Toffset',Toffset)
assignin('base','Gamma0',Gamma0)
assignin('base','S_Wing',S_Wing)
assignin('base','CLmax',CLmax)
assignin('base','CDCL2',CDCL2)
assignin('base','CDCL',CDCL)
assignin('base','CD0',CD0)
assignin('base','CLalpha',CLalpha)
assignin('base','CL0',CL0)
assignin('base','Psi',Psi)
assignin('base','V0',V0)
assignin('base','T0',T0)

sim('Cruise_Simulation')
[E_decent,T_decent] = Descent(Weight,h0,Max_Tn,Max_RPM,Number_of_Motors,Power_Compensation);
Total_E = E_climb + Energy(end) + E_decent;
Total_T = T_climb + tout(end) + T_decent;