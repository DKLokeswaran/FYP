% Define communication parameters
vehicleToVehicleRange = 250; % meters
rsuToVehicleRange = 500; % meters

% Create a structure to represent vehicles
vehicle(1:10).Road_ID = 1:10; % Replace with actual road IDs
vehicle(1:10).Vehicle_Density = rand(1, 10); % Random vehicle density values
vehicle(1:10).Average_Connection_Time = rand(1, 10) * 5; % Random connection time in seconds (0-5)
vehicle(1:10).Average_Delay = rand(1:10) * 2; % Random delay in seconds (0-2)
vehicle(1:10).Validity_Time = rand(1, 10); % Random validity time
vehicle(1:10).x = rand(1, 10) * 1000; % Random x-coordinates (0-1000 meters)
vehicle(1:10).y = rand(1, 10) * 1000; % Random y-coordinates (0-1000 meters)

% Create a structure to represent the RSU
rsu.x = 500; % x-coordinate of the RSU (center of the intersection)
rsu.y = 500; % y-coordinate of the RSU (center of the intersection)

% Initialize variables
vehicleNeighbors = cell(1, 10); % To store neighbors for each vehicle
rsuNeighbors = []; % To store vehicles within RSU range

% Loop through each vehicle
for i = 1:length(vehicle)
    % Find vehicles within vehicle-to-vehicle range
    vehicleNeighbors{i} = find(sqrt((vehicle(i).x - vehicle(j).x).^2 + ...
                                    (vehicle(i).y - vehicle(j).y).^2) <= vehicleToVehicleRange ...
                             & j ~= i);

    % Check if vehicle is within RSU range
    if sqrt((vehicle(i).x - rsu.x).^2 + (vehicle(i).y - rsu.y).^2) <= rsuToVehicleRange
        rsuNeighbors = [rsuNeighbors, i];
    end
end

% Communication with neighbors (replace with actual communication logic)
for i = 1:length(vehicle)
    for neighbor in vehicleNeighbors{i}
        % Share data (Road_ID, Vehicle_Density, etc.)
        disp(['Vehicle ', num2str(i), ' communicating with vehicle ', num2str(neighbor)]);
    end

    % Vehicle-to-RSU communication
    if ismember(i, rsuNeighbors)
        % Share data with RSU
        disp(['Vehicle ', num2str(i), ' communicating with RSU']);
    end
end
