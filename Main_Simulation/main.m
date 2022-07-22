%% Simulation of Network
clc
clear

%% Stations Locations
n = 4; % Number of Stations
load 4_Stations_Coordinate.mat
File_Name = 'Station_4_EVTOL_16_Dem_3000.mat';
X_Coordinate = StationsCoordinate.X_Coordinate;
Y_Coordinate = StationsCoordinate.Y_Coordinate;
Stations(:,1) = X_Coordinate(:,1);
Stations(:,2) = Y_Coordinate(:,1);

%% outputs
Number_of_simulations = 250;
Total_Number_of_Flights_all = [];
Percentage_of_Dead_Head_Flights_all = [];
Network_Energy_all = [];
Network_Energy_MJ_all = [];
Network_Energy_per_Passenger_all = [];
Network_Energy_per_Coverage_Area_all = [];
Number_of_Changing_Batteries_all = [];
Delay_of_Each_Station_all = [];
Average_Delay_of_Network_Sec_all = [];
Average_Delay_of_Network_Min_all = [];
Network_Time_Sec_With_Wasted_Time_all = [];
Network_Time_Min_With_Wasted_Time_all = [];
Network_Time_Hour_With_Wasted_Time_all = [];
Network_Time_per_Passenger_With_Wasted_Time_all = [];
Network_Time_per_Coverage_Area_With_Wasted_Time_all = [];
Network_Time_Sec_Without_Wasted_Time_all = [];
Network_Time_Min_Without_Wasted_Time_all = [];
Network_Time_Hour_Without_Wasted_Time_all = [];
Network_Time_per_Passenger_Without_Wasted_Time_all = [];
Network_Time_per_Coverage_Area_Without_Wasted_Time_all = [];
Flight_Frequency_With_Wasted_Time_all = [];
Flight_Frequency_Without_Wasted_Time_all = [];
Empty_Routes_all = [];
save(File_Name, 'Total_Number_of_Flights_all', 'Percentage_of_Dead_Head_Flights_all', 'Network_Energy_all', 'Network_Energy_MJ_all', 'Network_Energy_per_Passenger_all', 'Network_Energy_per_Coverage_Area_all', 'Number_of_Changing_Batteries_all', 'Delay_of_Each_Station_all', 'Average_Delay_of_Network_Sec_all', 'Average_Delay_of_Network_Min_all', 'Network_Time_Sec_With_Wasted_Time_all', 'Network_Time_Min_With_Wasted_Time_all', 'Network_Time_Hour_With_Wasted_Time_all', 'Network_Time_per_Passenger_With_Wasted_Time_all', 'Network_Time_per_Coverage_Area_With_Wasted_Time_all', 'Network_Time_Sec_Without_Wasted_Time_all', 'Network_Time_Min_Without_Wasted_Time_all', 'Network_Time_Hour_Without_Wasted_Time_all', 'Network_Time_per_Passenger_Without_Wasted_Time_all', 'Network_Time_per_Coverage_Area_Without_Wasted_Time_all', 'Flight_Frequency_With_Wasted_Time_all', 'Flight_Frequency_Without_Wasted_Time_all', 'Empty_Routes_all')

%% Monte Carlo Simulation
for montecounter = 1:Number_of_simulations
    
    %% Demand Matirx
    Demand = 3000;
    Total_Passengers = 3000;
    Coverage_Radius = 5; % km
    Coverage_Area = round(n*pi*(Coverage_Radius^2)); % km^2
    Distribution = zeros(n);

    for counterr = 1:n^2

        if mod(counterr,n+1) ~= 1 && counterr ~= n^2-1
            Distribution(counterr) = round(unifrnd(0,Demand/(n)));
            Demand = Demand - Distribution(counterr);
        elseif counterr == n^2-1
            Distribution(counterr) = Demand;
        end

    end
    
    Empty_Routes = ((size(Distribution(Distribution==0),1) - n)/(n^2 - n))*100; % Percentage of routes without demand (Measuring factor which illustrates some relation between demand and number of stations, ie. 100 demand is not appealing to be distributed among 16 stations)
    
    %% simulation
    m = 16; % Number of Airplanes
    Total_Energy = zeros(m,1); % Each Airplanes Total Energy
    
    Airplanes_Time = zeros(m,1);
    Arrival_Time = zeros(n,10000000); % Arrival Time in Each Station
    i = 1; % Counter of Arrival_Time Matrix
    Delay_of_Each_Station = zeros(n,1);
    Changing_Batteries_Time = 90;
    Boarding_Time = 240;
    Deboarding_Time = 150;
    Clearance_Time = 45;

    Airplanes_Loc = randi([1,n],m,1); % Generates a m*1 vector with elements between 1 & n

    Number_of_Dead_Head_Flights = 0; % The number of dead-head flights
    Number_of_Flights = 0; % The number of flights with passenger

    Next_Destination = zeros(m,1);

    while 1    

        for counter = 1:m % Put "for" at the top to figure the situation of being more than one EVTOL in a station simultaneously out

            Station_Tot_Dem = sum(Distribution,2); % Total Number of Demand in Each Station
            Flight_Energy = 0;
            Flight_Time = 0;

            if Station_Tot_Dem(Airplanes_Loc(counter)) ~= 0 % To make airplanes goes to new destination if there is a demand in their current stations

                MAX_Pax = max(Distribution,[],2); % Maximum passengers in each station
                Distance = [];
                Station_Number = [];

                for j = 1:n % Solving the problem of choosing destination station for each EVTOL in a case of equal demand in some routes of origin station (In this situation the EVTOL chooses the route to nearest station) 

                   if Distribution(Airplanes_Loc(counter),j) == MAX_Pax(Airplanes_Loc(counter))

                       Distance = [Distance;sqrt((Stations(Airplanes_Loc(counter),1) - Stations(j,1))^2 + (Stations(Airplanes_Loc(counter),2) - Stations(j,2))^2)];
                       Station_Number = [Station_Number;j];

                   end

                end

                [~,idx] = min(Distance); % To find the nearest station number with heighest demand
                index = Station_Number(idx); % Nearest station number with heighest demand
                Next_Destination(counter) = index;
                Xd = Stations(Next_Destination(counter),1);
                Yd = Stations(Next_Destination(counter),2);
                X0 = Stations(Airplanes_Loc(counter),1);
                Y0 = Stations(Airplanes_Loc(counter),2);
                Number_of_Passenger = min(4,Distribution(Airplanes_Loc(counter),Next_Destination(counter)));
                Range = sqrt((Xd - X0)^2 + (Yd - Y0)^2);
                h0 = find_best_h(Range,Number_of_Passenger);
                [Flight_Energy,Flight_Time] = flight(X0,Y0,Xd,Yd,h0,Number_of_Passenger);
                Total_Energy(counter) = Total_Energy(counter) + Flight_Energy;
                Airplanes_Time(counter) = Airplanes_Time(counter) + Flight_Time;
                Distribution(Airplanes_Loc(counter),Next_Destination(counter)) = Distribution(Airplanes_Loc(counter),Next_Destination(counter))-Number_of_Passenger;
                Airplanes_Loc(counter) = Next_Destination(counter);
                Arrival_Time(Next_Destination(counter),i) = Airplanes_Time(counter); % Add the airplane time infront of each station shows when an airplane lands in that station
                i = i + 1;
                Number_of_Flights = Number_of_Flights + 1;

            end

            Station_Tot_Dem = sum(Distribution,2);
            Non_Zero_Dem_Station_Number = find(Station_Tot_Dem); % Finding stations number which still have demand
            Stations_Number_Having_Dem_Not_Having_Airplane = setdiff(Non_Zero_Dem_Station_Number,Airplanes_Loc); % Finding stations number which still have demand and not not having any EVTOL inside
            Empty = isempty(Stations_Number_Having_Dem_Not_Having_Airplane);    

            if Station_Tot_Dem(Airplanes_Loc(counter)) == 0 && sum(sum(Distribution)) ~= 0 && Empty == 0 % To make airplanes perform a dead head flight to the nearest station which has demand but does not contain any airplane

                Distance_Dead_Head = [];
                Station_Number_Dead_Head = [];

                for jj = 1:size(Stations_Number_Having_Dem_Not_Having_Airplane,1) % Finding distance between current location of airplane and candidtae stations to perform a dead head flight

                    Distance_Dead_Head = [Distance_Dead_Head;sqrt((Stations(Airplanes_Loc(counter),1) - Stations(Stations_Number_Having_Dem_Not_Having_Airplane(jj),1))^2 + (Stations(Airplanes_Loc(counter),2) - Stations(Stations_Number_Having_Dem_Not_Having_Airplane(jj),2))^2)];
                    Station_Number_Dead_Head = [Station_Number_Dead_Head;Stations_Number_Having_Dem_Not_Having_Airplane(jj)];

                end

                [~,idx_Dead_Head] = min(Distance_Dead_Head); % To find the nearest station number which contains some demand but does not contain any airplane
                index_Dead_Head = Station_Number_Dead_Head(idx_Dead_Head); % Nearest station number which contains some demand but does not contain any airplane
                Next_Destination(counter) = index_Dead_Head;
                Xd = Stations(Next_Destination(counter),1);
                Yd = Stations(Next_Destination(counter),2);
                X0 = Stations(Airplanes_Loc(counter),1);
                Y0 = Stations(Airplanes_Loc(counter),2);
                Number_of_Passenger = 0;
                Range = sqrt((Xd - X0)^2 + (Yd - Y0)^2);
                h0 = find_best_h(Range,Number_of_Passenger);
                [Flight_Energy,Flight_Time] = flight(X0,Y0,Xd,Yd,h0,Number_of_Passenger);
                Total_Energy(counter) = Total_Energy(counter) + Flight_Energy;
                Airplanes_Time(counter) = Airplanes_Time(counter) + Flight_Time;
                Airplanes_Loc(counter) = Next_Destination(counter);
                Arrival_Time(Next_Destination(counter),i) = Airplanes_Time(counter);
                i = i + 1;
                Number_of_Dead_Head_Flights = Number_of_Dead_Head_Flights + 1;

            end

            if Station_Tot_Dem(Airplanes_Loc(counter)) == 0 && sum(sum(Distribution)) == 0 % To make airplanes stay in their current situation when there is no demand in the network

                Flight_Energy = 0;
                Flight_Time = 0;
                Total_Energy(counter) = Total_Energy(counter) + Flight_Energy;
                Airplanes_Time(counter) = Airplanes_Time(counter) + Flight_Time;

            end

        end

        if sum(sum(Distribution)) == 0

            break

        end

    end

    %% Flights Relative Outputs
    Total_Number_of_Flights = Number_of_Flights + Number_of_Dead_Head_Flights;
    Percentage_of_Dead_Head_Flights = (Number_of_Dead_Head_Flights/Total_Number_of_Flights)*100;

    %% Energy Relative Outputs
    Network_Energy = sum(sum(Total_Energy));
    Network_Energy_MJ = Network_Energy/1000000;
    Network_Energy_per_Passenger = Network_Energy_MJ/Total_Passengers;
    Network_Energy_per_Coverage_Area = Network_Energy_MJ/Coverage_Area;
    Number_of_Changing_Batteries = round(Network_Energy/339000000);

    %% Time Relative Outputs
    for jjj = 1:n % To compute the delay in each station

       Arrival_Time_Each_Station_Including_Zero_Elements = Arrival_Time(jjj,:);
       Arrival_Time_Each_Station_Excluding_Zero_Elements = Arrival_Time_Each_Station_Including_Zero_Elements(Arrival_Time_Each_Station_Including_Zero_Elements~=0);
       Number_of_Elements = numel(Arrival_Time_Each_Station_Excluding_Zero_Elements);
       if Number_of_Elements == 1

           Delay_of_Each_Station(jjj) = Arrival_Time_Each_Station_Excluding_Zero_Elements;

       end

       if Number_of_Elements ~= 1

           Delay_of_Each_Station(jjj) = mean(abs(diff(Arrival_Time_Each_Station_Excluding_Zero_Elements(:))));

       end

    end
    Average_Delay_of_Network_Sec = mean(Delay_of_Each_Station);
    Average_Delay_of_Network_Min = round(Average_Delay_of_Network_Sec/60);
    Network_Time_Sec_With_Wasted_Time = max(Airplanes_Time,[],'all') + Number_of_Changing_Batteries*Changing_Batteries_Time + Number_of_Flights*Boarding_Time + Number_of_Flights*Deboarding_Time + Total_Number_of_Flights*Clearance_Time; % Netwotk time = (Maximum flying time among flying time of all EVTOLs) + (Time to spend changing batteries assumes each changing process longs average of 90s) + (Boarding time of passengers assumes average of 240s) + (De-boarding time of passengers assumes average of 150s) + (Airspace clearance assumes average time of 45s)
    Network_Time_Min_With_Wasted_Time = round(Network_Time_Sec_With_Wasted_Time/60);
    Network_Time_Hour_With_Wasted_Time = round(Network_Time_Sec_With_Wasted_Time/3600,1);
    Network_Time_per_Passenger_With_Wasted_Time = Network_Time_Min_With_Wasted_Time/Total_Passengers;
    Network_Time_per_Coverage_Area_With_Wasted_Time = Network_Time_Min_With_Wasted_Time/Coverage_Area;

    Network_Time_Sec_Without_Wasted_Time = max(Airplanes_Time,[],'all');
    Network_Time_Min_Without_Wasted_Time = round(Network_Time_Sec_Without_Wasted_Time/60);
    Network_Time_Hour_Without_Wasted_Time = round(Network_Time_Sec_Without_Wasted_Time/3600,1);
    Network_Time_per_Passenger_Without_Wasted_Time = Network_Time_Min_Without_Wasted_Time/Total_Passengers;
    Network_Time_per_Coverage_Area_Without_Wasted_Time = Network_Time_Min_Without_Wasted_Time/Coverage_Area;

    %% Flight Frequency
    Flight_Frequency_With_Wasted_Time = round(Total_Number_of_Flights/Network_Time_Hour_With_Wasted_Time);
    Flight_Frequency_Without_Wasted_Time = round(Total_Number_of_Flights/Network_Time_Hour_Without_Wasted_Time);
    
    %% Saving
    saveoutputs(Total_Number_of_Flights, Percentage_of_Dead_Head_Flights, Network_Energy, Network_Energy_MJ, Network_Energy_per_Passenger, Network_Energy_per_Coverage_Area, Number_of_Changing_Batteries, Delay_of_Each_Station, Average_Delay_of_Network_Sec, Average_Delay_of_Network_Min, Network_Time_Sec_With_Wasted_Time, Network_Time_Min_With_Wasted_Time, Network_Time_Hour_With_Wasted_Time, Network_Time_per_Passenger_With_Wasted_Time, Network_Time_per_Coverage_Area_With_Wasted_Time, Network_Time_Sec_Without_Wasted_Time, Network_Time_Min_Without_Wasted_Time, Network_Time_Hour_Without_Wasted_Time, Network_Time_per_Passenger_Without_Wasted_Time, Network_Time_per_Coverage_Area_Without_Wasted_Time, Flight_Frequency_With_Wasted_Time, Flight_Frequency_Without_Wasted_Time, Empty_Routes, 'Station_4_EVTOL_16_Dem_3000.mat');

end

function saveoutputs(Total_Number_of_Flights,Percentage_of_Dead_Head_Flights,Network_Energy, Network_Energy_MJ, Network_Energy_per_Passenger, Network_Energy_per_Coverage_Area, Number_of_Changing_Batteries, Delay_of_Each_Station, Average_Delay_of_Network_Sec, Average_Delay_of_Network_Min, Network_Time_Sec_With_Wasted_Time, Network_Time_Min_With_Wasted_Time, Network_Time_Hour_With_Wasted_Time, Network_Time_per_Passenger_With_Wasted_Time, Network_Time_per_Coverage_Area_With_Wasted_Time, Network_Time_Sec_Without_Wasted_Time, Network_Time_Min_Without_Wasted_Time, Network_Time_Hour_Without_Wasted_Time, Network_Time_per_Passenger_Without_Wasted_Time, Network_Time_per_Coverage_Area_Without_Wasted_Time, Flight_Frequency_With_Wasted_Time, Flight_Frequency_Without_Wasted_Time, Empty_Routes, filename) % To save outputs when using parfor option

load(filename)
Total_Number_of_Flights_all = [Total_Number_of_Flights_all;Total_Number_of_Flights];
Percentage_of_Dead_Head_Flights_all = [Percentage_of_Dead_Head_Flights_all; Percentage_of_Dead_Head_Flights];
Network_Energy_all = [Network_Energy_all; Network_Energy];
Network_Energy_MJ_all = [Network_Energy_MJ_all; Network_Energy_MJ];
Network_Energy_per_Passenger_all = [Network_Energy_per_Passenger_all;Network_Energy_per_Passenger];
Network_Energy_per_Coverage_Area_all = [Network_Energy_per_Coverage_Area_all;Network_Energy_per_Coverage_Area];
Number_of_Changing_Batteries_all = [Number_of_Changing_Batteries_all;Number_of_Changing_Batteries];
Delay_of_Each_Station_all = [Delay_of_Each_Station_all, Delay_of_Each_Station];
Average_Delay_of_Network_Sec_all = [Average_Delay_of_Network_Sec_all;Average_Delay_of_Network_Sec];
Average_Delay_of_Network_Min_all = [Average_Delay_of_Network_Min_all;Average_Delay_of_Network_Min];
Network_Time_Sec_With_Wasted_Time_all = [Network_Time_Sec_With_Wasted_Time_all;Network_Time_Sec_With_Wasted_Time];
Network_Time_Min_With_Wasted_Time_all = [Network_Time_Min_With_Wasted_Time_all;Network_Time_Min_With_Wasted_Time];
Network_Time_Hour_With_Wasted_Time_all = [Network_Time_Hour_With_Wasted_Time_all;Network_Time_Hour_With_Wasted_Time];
Network_Time_per_Passenger_With_Wasted_Time_all = [Network_Time_per_Passenger_With_Wasted_Time_all;Network_Time_per_Passenger_With_Wasted_Time];
Network_Time_per_Coverage_Area_With_Wasted_Time_all = [Network_Time_per_Coverage_Area_With_Wasted_Time_all;Network_Time_per_Coverage_Area_With_Wasted_Time];
Network_Time_Sec_Without_Wasted_Time_all = [Network_Time_Sec_Without_Wasted_Time_all;Network_Time_Sec_Without_Wasted_Time];
Network_Time_Min_Without_Wasted_Time_all = [Network_Time_Min_Without_Wasted_Time_all;Network_Time_Min_Without_Wasted_Time];
Network_Time_Hour_Without_Wasted_Time_all = [Network_Time_Hour_Without_Wasted_Time_all;Network_Time_Hour_Without_Wasted_Time];
Network_Time_per_Passenger_Without_Wasted_Time_all = [Network_Time_per_Passenger_Without_Wasted_Time_all;Network_Time_per_Passenger_Without_Wasted_Time];
Network_Time_per_Coverage_Area_Without_Wasted_Time_all = [Network_Time_per_Coverage_Area_Without_Wasted_Time_all;Network_Time_per_Coverage_Area_Without_Wasted_Time];
Flight_Frequency_With_Wasted_Time_all = [Flight_Frequency_With_Wasted_Time_all;Flight_Frequency_With_Wasted_Time];
Flight_Frequency_Without_Wasted_Time_all = [Flight_Frequency_Without_Wasted_Time_all;Flight_Frequency_Without_Wasted_Time];
Empty_Routes_all = [Empty_Routes_all;Empty_Routes];
save(filename,'Total_Number_of_Flights_all', 'Percentage_of_Dead_Head_Flights_all', 'Network_Energy_all', 'Network_Energy_MJ_all', 'Network_Energy_per_Passenger_all', 'Network_Energy_per_Coverage_Area_all', 'Number_of_Changing_Batteries_all', 'Delay_of_Each_Station_all', 'Average_Delay_of_Network_Sec_all', 'Average_Delay_of_Network_Min_all', 'Network_Time_Sec_With_Wasted_Time_all', 'Network_Time_Min_With_Wasted_Time_all', 'Network_Time_Hour_With_Wasted_Time_all', 'Network_Time_per_Passenger_With_Wasted_Time_all', 'Network_Time_per_Coverage_Area_With_Wasted_Time_all', 'Network_Time_Sec_Without_Wasted_Time_all', 'Network_Time_Min_Without_Wasted_Time_all', 'Network_Time_Hour_Without_Wasted_Time_all', 'Network_Time_per_Passenger_Without_Wasted_Time_all', 'Network_Time_per_Coverage_Area_Without_Wasted_Time_all', 'Flight_Frequency_With_Wasted_Time_all', 'Flight_Frequency_Without_Wasted_Time_all', 'Empty_Routes_all')

end