% MATLAB File: QTofi.m
% Purpose: Loads partition function data from input files for temperature-dependent calculations.

function QTofi()
    global PartitionFunctionData SpectralDataFiles Temperature

    % Initialize storage
    PartitionFunctionData = struct();

    % Loop over each file (can be extended for multiple molecules)
    for i = 1:length(SpectralDataFiles)
        filename = SpectralDataFiles{i};
        if exist(filename, 'file')
            % Load data: expects two columns (Temperature, Partition Function)
            data = load(filename);
            PartitionFunctionData(i).Temperature = data(:,1);
            PartitionFunctionData(i).Q = data(:,2);

            % Interpolate partition function for current Temperature
            PartitionFunctionData(i).CurrentQ = interp1(data(:,1), data(:,2), Temperature, 'linear', 'extrap');
        else
            error(['Partition function file not found: ', filename]);
        end
    end
end
