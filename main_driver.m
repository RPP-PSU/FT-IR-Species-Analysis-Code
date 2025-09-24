% MATLAB File: main_driver.m
% Purpose: Main driver script for FT-IR Species Analysis Code, now launches GUI for input selection.

% Get user input from GUI
params = FTIR_Input_GUI();

% Abort run if GUI was cancelled
if isempty(params)
    disp('Analysis aborted. Please run again and complete input selection.');
    return;
end

% Assign global variables from GUI
global PartitionFunctionData SpectralDataFiles NumLinesPerMolecule MoleculeIDs HitranInputFiles
global MinWavenumber MaxWavenumber PartitionFunctionRatios InternalPartitionSums IsotopologueVector
global WavenumberData MeasuredTransmittance NumDataPoints TotalPressure Temperature IntegrationStepSize OpticalDepthArray
global CalculatedTransmittance CoefficientArray NumCoefficients CovarianceMatrix AlphaMatrix ChiSquared Lambda
global ConvergenceFlag IterationCount OutputFilePath1 OutputFilePath2 MoleculeNames InputFilePath

SpectralDataFiles = {params.PartitionFile};
HitranInputFiles  = {params.HitranFile};
InputFilePath     = params.MeasuredFile;
OutputFilePath1   = params.OutputTrans;
OutputFilePath2   = params.OutputCoeff;
MinWavenumber     = params.MinWavenumber;
MaxWavenumber     = params.MaxWavenumber;
TotalPressure     = params.TotalPressure;
Temperature       = params.Temperature;
IntegrationStepSize = params.IntegrationStepSize;

% Save settings if requested (future enhancement: implement save/load logic)
if isfield(params, 'SaveSettings') && params.SaveSettings
    disp('Saving settings for future runs... (not yet implemented)');
    % Future: save params to a mat/txt file for reload
end

% Run analysis
QTofi();
INPUT();
INDAT();
MRQMIN();
OUTPT();

disp('FT-IR Species analysis complete. Output files written.');
