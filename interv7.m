for i=1:20
    updateTable(1, i, i, i, i);
end
function updateTable(roadID, avgVehicleDensity, avgConnTime, avgDelayTime, minValidityTime)
    % Load existing table if available, otherwise create a new one
    if exist('roadData.mat', 'file') == 2
        load('roadData.mat', 'roadTable');
    else
        roadTable = table('Size', [0, 5], 'VariableTypes', {'double', 'double', 'double', 'double', 'double'}, ...
            'VariableNames', {'RoadID', 'AvgVehicleDensity', 'AvgConnTime', 'AvgDelayTime', 'MinValidityTime'});
    end

    % Convert RoadID to cell array for comparison
    roadIDs = num2cell(roadTable.RoadID);

    % Check if roadID exists in the table
    idx = find(strcmp(roadIDs, roadID));

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

    % Save the updated table
    save('roadData.mat', 'roadTable');

end
