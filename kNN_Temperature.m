% This program is an example for implementaion of kNN Algorithm.
% Inputs are temperature, wind, humidity and precipitation values taken
% from http://www.timeanddate.com/weather/india/new-delhi/hourly for 23
% August. The test data is picked from the same sourse for August 24, 2015.
% Coded by: Shubham Agrawal


k = 7; % Number of nearest neighbours we want to evaluate to find the result of current search query.

qTemp     = 30;
qWind     = 12;
qHumidity = 72;
query     = [qTemp qWind qHumidity];

temp          = xlsread('E:\Work\kNN Exmple\TemperatureSheet.xlsx','sheet1', 'a2:a24');
wind          = xlsread('E:\Work\kNN Exmple\TemperatureSheet.xlsx','sheet1', 'b2:b24');
humidity      = xlsread('E:\Work\kNN Exmple\TemperatureSheet.xlsx','sheet1', 'c2:c24');
precipitation = xlsread('E:\Work\kNN Exmple\TemperatureSheet.xlsx','sheet1', 'd2:d24');

%Start(0) Calculating Euclidean Distance between the query points and
%previous data.

z1 = (query(1) - temp).^2;
z2 = (query(2) - wind).^2;
z3 = (query(3) - humidity).^2;

euclideanDistance = z1 + z2 + z3; %Euclidean distance in square units

%End (0)

distance       = [euclideanDistance precipitation]; % Appending the output(precipitation) vector to distance.
sortedDistance = sortrows(distance); % sort the distance vector based on the proximity to search query.

precipitation  = mode(sortedDistance(1:k,2)); % Find the most frequently occuring class value( here, precipitation)

if(precipitation == 1)
    disp('High')
else
    disp('Low')
end
