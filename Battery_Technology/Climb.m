%% Climb Phase
function [Energy_Consumption,Time] = Climb(Weight,h0,Max_Tn,Max_RPM,Number_of_Motors,Power_Compensation)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
g = 9.8;%m/s2
a = 1.5;%m/s2
Tn = ((Weight/g)*a + Weight)/(Number_of_Motors);
Time = sqrt(2*h0/a);
Tn_Fraction_Domain = [0	0.028414232	0.12143652	0.204120688	0.279068945	0.395219919	0.509043256	0.638242727	0.785530791	1];
RPM(:) = [0	0.182070075	0.361369324	0.456560601	0.535171612	0.633089024	0.720012513	0.805505899	0.889658563	1];
Tn_Fraction = Tn/(Max_Tn);
RPM_Fraction = interp1(Tn_Fraction_Domain,RPM(:),Tn_Fraction);
RPM = RPM_Fraction*Max_RPM;
RPM_Domain = [0	155.8	957	2115	2304	2515	2994];
Power_Domain(:) = [0	8078	41928	87012	95072	99855	107758];
Power = (Power_Compensation/8)*interp1(RPM_Domain,Power_Domain(:),RPM);%W
Energy_Consumption = Number_of_Motors*Power*Time;%  
end

