axis([0 1000 0 1000]);  % Set the window size to 1000
DELAY=0.5;
DELAY1=0.45;

% Define parameters for 16 intersections
intersection_coordinates = randi([100, 900], 16, 2);  % Randomly generate coordinates for 16 intersections

% Plot the intersections
for i = 1:size(intersection_coordinates, 1)
    plot(intersection_coordinates(i, 1), intersection_coordinates(i, 2), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
    hold on;
end

num_vehicles = 50;

for vehicle = 1:num_vehicles
    [x1, y1] = ginput(2);              % Take input from user for each vehicle's path
    line(x1, y1, 'color', 'black');    % Draw the line (Road)
    hold on ; 
    
    % Randomly select an intersection for each vehicle
    intersection_index = randi([1, size(intersection_coordinates, 1)]);
    intersection_x = intersection_coordinates(intersection_index, 1);
    intersection_y = intersection_coordinates(intersection_index, 2);
    
    rnd_speed=randi([10,20],1,1);
    dist_line=sqrt((x1(2)-x1(1))^2+(y1(2)-y1(1))^2);     % Distance between 2 points is calculated
    speed_new=round(dist_line/rnd_speed);                % This is the new speed for the vehicle
    
    point1=linspace(x1(1),x1(2),speed_new);  % Random speed is given by taking new speed number of points in a linspace
    point2=linspace(y1(1),y1(2),speed_new);
    
    vehicle_plot = plot(point1(1), point2(1), 's', 'MarkerFaceColor', 'red');  % Plot vehicle on the road
    title('V2V and V2I connectivity simulation');   % Title is given to the figure

    for k = 1:speed_new
        vehicle_plot.XData = point1(k);  % Vehicle's x co-ordinate
        vehicle_plot.YData = point2(k);  % Vehicle's y co-ordinate
        
        % Check if the vehicle is within range of any intersection
        intersection_distance = sqrt((intersection_x - point1(k))^2 + (intersection_y - point2(k))^2);
        if intersection_distance <= 100  % If the distance is within 100 m
            line1 = plot([point1(k), intersection_x], [point2(k), intersection_y], '--', 'color', 'red');  % Show connectivity between vehicle and intersection
            pause(0.3);  % Delay of 0.3
            set(line1, 'Visible', 'off');  % Visibility property of line is set to 'off'
        end
        
        pause(DELAY1);  % Delay of 0.45
    end
    
    set(vehicle_plot, 'Visible', 'off');  % Visibility property of vehicle's position is set to 'off'
end

hold off;
