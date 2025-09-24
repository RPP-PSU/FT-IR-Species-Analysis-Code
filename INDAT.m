% MATLAB File: INDAT.m
% Purpose: Loads measured FT-IR wavenumber and transmittance data from file and filters by spectral range.

function INDAT()
    global InputFilePath MinWavenumber MaxWavenumber WavenumberData MeasuredTransmittance NumDataPoints

    if exist(InputFilePath, 'file')
        % Assumes two columns: [Wavenumber, Transmittance]
        data = load(InputFilePath);

        % Filter data for the specified wavenumber range
        idx = (data(:,1) >= MinWavenumber) & (data(:,1) <= MaxWavenumber);
        filtered = data(idx, :);

        WavenumberData = filtered(:,1);
        MeasuredTransmittance = filtered(:,2);
        NumDataPoints = length(WavenumberData);
    else
        error(['Measured FT-IR data file not found: ', InputFilePath]);
    end
end
