for i=1:20
    updateTable(1, i, i, i, i);
end
function updateTable(roadID, avgVehicleDensity, avgConnTime, avgDelayTime, minValidityTime)
    % Define persistent variable to hold the table
    persistent roadTable

    % If roadTable doesn't exist, create a new one
    if isempty(roadTable)
        roadTable = table('Size', [0, 5], 'VariableTypes', {'double', 'double', 'double', 'double', 'double'}, ...
            'VariableNames', {'RoadID', 'AvgVehicleDensity', 'AvgConnTime', 'AvgDelayTime', 'MinValidityTime'});
    end

    % Check if roadID exists in the table
    idx = find(roadTable.RoadID == roadID);

    % If roadID exists, update values; otherwise, add a new row
    if isempty(idx)
        newRow = {roadID, avgVehicleDensity, avgConnTime, avgDelayTime, minValidityTime};
        roadTable = [roadTable; newRow];
    else
        roadTable.AvgVehicleDensity(idx) = avgVehicleDensity;
        roadTable.AvgConnTime(idx) = avgConnTime;
        roadTable.AvgDelayTime(idx) = avgDelayTime;
        roadTable.MinValidityTime(idx) = minValidityTime;
    end
    disp(roadTable);
end

