% MATLAB File: global_variables.m
% Purpose: Defines and initializes shared/global variables for FT-IR Species Analysis Code.

% Partition function data
global PartitionFunctionData;               % Stores partition function values
global SpectralDataFiles;                   % Stores the file names for partition function data

% HITRAN and spectral data
global NumLinesPerMolecule;                 % Array: number of lines for each molecule
global MoleculeIDs;                         % Array: IDs for molecules to process
global HitranInputFiles;                    % Array: HITRAN data filenames
global MinWavenumber MaxWavenumber;         % Spectral range limits
global PartitionFunctionRatios;             % Partition function ratios for each isotopologue
global InternalPartitionSums;               % Internal partition sums for each molecule/isotopologue
global IsotopologueVector;                  % Number of isotopologues per molecule

% Measurement data
global WavenumberData;                      % Wavenumber values from measured data
global MeasuredTransmittance;               % Transmittance values from measured data
global NumDataPoints;                       % Number of measured data points

% Calculation variables
global TotalPressure;                       % Total pressure (atm)
global Temperature;                         % Temperature (K)
global IntegrationStepSize;                 % Step size for wavenumber integration
global OpticalDepthArray;                   % Stores optical depth calculation results

% Fitting and optimization
global CalculatedTransmittance;             % Model-calculated transmittance values
global CoefficientArray;                    % Array of coefficients to be fit
global NumCoefficients;                     % Number of coefficients in fit
global CovarianceMatrix;                    % Covariance matrix of fit coefficients
global AlphaMatrix;                         % Alpha matrix for Levenberg-Marquardt algorithm
global ChiSquared;                          % Chi-squared value for fit
global Lambda;                              % Marquardt fitting parameter
global ConvergenceFlag;                     % Indicates convergence in fitting
global IterationCount;                      % Number of iterations in fit

% Output control
global OutputFilePath1 OutputFilePath2;     % Output file paths for results
global MoleculeNames;                       % Names of molecules for output labeling

% Input control
global InputFilePath;                       % Path to measured data file
