% Define number of intersections and roads
numIntersections = 4; % Assuming 4 intersections
numRoadsPerIntersection = 4; % Assuming 4 roads per intersection
numVehiclesPerRoad = 10; % Assuming 10 vehicles per road

% Initialize data structures to store information
intersectionTables = cell(numIntersections, 1);

% Simulate communication for each intersection
for i = 1:numIntersections
    % Initialize table for current intersection
    intersectionTable = table();
    
    for j = 1:numRoadsPerIntersection
        % Simulate V2V communication
        % Assuming vehicles exchange information within their range
        
        % Simulate V2R communication
        % Generate random data for communication
        roadID = sprintf('Road_%d_%d', i, j);
        vehicleDensity = randi([50, 200], 1, numVehiclesPerRoad); % Random vehicle density
        avgConnectionTime = randi([1, 10], 1, numVehiclesPerRoad); % Random connection time
        avgDelay = randi([1, 5], 1, numVehiclesPerRoad); % Random delay
        validityTime = randi([10, 60], 1, numVehiclesPerRoad); % Random validity time
        
        % Aggregate data for transmission to RSU
        avgVehicleDensity = mean(vehicleDensity);
        avgConnTime = mean(avgConnectionTime);
        avgDelayTime = mean(avgDelay);
        minValidityTime = min(validityTime);
        
        % Add data to intersection table
        newData = {roadID, avgVehicleDensity, avgConnTime, avgDelayTime, minValidityTime};
        intersectionTable = [intersectionTable; newData];
    end
    
    % Assign table to intersection
    intersectionTables{i} = intersectionTable;
end

% Display tables for each intersection
for i = 1:numIntersections
    disp(['Intersection ', num2str(i), ' Table:']);
    disp(intersectionTables{i});
end
