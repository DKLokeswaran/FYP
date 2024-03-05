% Define the updateTable function
function updateTable(roadID, avgVehicleDensity, avgConnTime, avgDelayTime, minValidityTime)
    % Define or initialize the global table 'roadData'
    global roadData;
    if isempty(roadData)
        roadData = table('Size', [0, 5], 'VariableTypes', {'double', 'double', 'double', 'double', 'double'}, 'VariableNames', {'RoadID', 'AvgVehicleDensity', 'AvgConnTime', 'AvgDelayTime', 'MinValidityTime'});
    end

    % Check if roadID already exists in the table
    if ~isempty(roadData)
        idx = find(cellfun(@(x) isequal(x, roadID), roadData.RoadID));
    else
        idx = [];
    end
    
    if isempty(idx)
        % RoadID does not exist, create a new row
        newRow = {roadID, avgVehicleDensity, avgConnTime, avgDelayTime, minValidityTime};
        roadData = [roadData; newRow];
        roadData.Properties.VariableNames = {'RoadID', 'AvgVehicleDensity', 'AvgConnTime', 'AvgDelayTime', 'MinValidityTime'};
    else
        % RoadID exists, update the values
        roadData.AvgVehicleDensity(idx) = avgVehicleDensity;
        roadData.AvgConnTime(idx) = avgConnTime;
        roadData.AvgDelayTime(idx) = avgDelayTime;
        roadData.MinValidityTime(idx) = minValidityTime;
    end
    
    % Display the updated table
    disp(roadData);
end

% Add any additional initialization code if needed
global roadData;
roadData = []; % Initialize roadData as empty

% Call the function to update the table with sample data
updateTable(1, 100, 10, 5, 2);

% Display the updated table
disp(roadData);
