%% Angle of Attack
function [alpha0] = alpha_init(Number_of_Passenger)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Pax_Domain = [0 1 2 3 4];
alpha0_Domain = [.05 .06 .068 .073 .08];
alpha0=interp1(Pax_Domain,alpha0_Domain,Number_of_Passenger);
end

