% MATLAB File: main_driver.m
% Purpose: Main driver script for FT-IR Species Analysis Code.
% Orchestrates loading input files, initializing variables, running subroutines, and writing outputs.

% Initialize global variables
global PartitionFunctionData SpectralDataFiles NumLinesPerMolecule MoleculeIDs HitranInputFiles
global MinWavenumber MaxWavenumber PartitionFunctionRatios InternalPartitionSums IsotopologueVector
global WavenumberData MeasuredTransmittance NumDataPoints TotalPressure Temperature IntegrationStepSize OpticalDepthArray
global CalculatedTransmittance CoefficientArray NumCoefficients CovarianceMatrix AlphaMatrix ChiSquared Lambda
global ConvergenceFlag IterationCount OutputFilePath1 OutputFilePath2 MoleculeNames InputFilePath

% ----------------------------- Configuration -----------------------------
InputFilePath      = 'C:\FTIR_Data\MeasuredData.dat'; % Measured FT-IR data
OutputFilePath1    = 'C:\FTIR_Data\Results_Transmittance.dat'; % Output: transmittance
OutputFilePath2    = 'C:\FTIR_Data\Results_Coefficients.dat';  % Output: coefficients/covariance
SpectralDataFiles  = {'C:\QUANT\Partition-Sums\Input_File_data.txt'}; % Partition function file list
HitranInputFiles   = {'C:\QUANT\Hitran\H2O.i', 'C:\QUANT\Hitran\CO2.i'}; % Example HITRAN files
MinWavenumber      = 600;    % cm^-1
MaxWavenumber      = 2400;   % cm^-1
TotalPressure      = 1.0;    % atm
Temperature        = 296.0;  % K
IntegrationStepSize= 0.01;   % cm^-1

% --------------------------- Load Partition Functions ---------------------
QTofi();

% --------------------------- Load HITRAN and Setup ------------------------
INPUT();

% ------------------------- Load Measured Data -----------------------------
INDAT();

% ------------------------- Fitting Procedure ------------------------------
MRQMIN();

% -------------------------- Output Results --------------------------------
OUTPT();

disp('FT-IR Species analysis complete. Output files written.');
