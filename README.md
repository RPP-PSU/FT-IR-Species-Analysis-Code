# FT-IR Species Analysis Code

This repository contains MATLAB code for analyzing FT-IR (Fourier-transform infrared spectroscopy) spectra for various chemical species. The code was translated from legacy FORTRAN and modularized for clarity, maintainability, and revision control.

## Overview

The main goal of this program is to determine the partial pressures of specific molecules using measured FT-IR spectral data. It uses nonlinear least squares fitting (Levenberg-Marquardt algorithm) to optimize parameters so that modeled transmittance matches experimental data.

## Structure

- `global_variables.m` — Defines and initializes all shared/global variables.
- `main_driver.m` — Orchestrates the program: loads data, sets parameters, runs subroutines.
- Subroutines:
  - `QTofi.m` — Loads partition function data.
  - `INPUT.m` — Reads and processes HITRAN line data.
  - `INDAT.m` — Loads measured FT-IR wavenumber and transmittance data.
  - `MRQMIN.m` — Performs nonlinear least squares optimization (Levenberg-Marquardt).
  - `OUTPT.m` — Writes results to output files (fitted coefficients, residuals, etc.).

## How to Run

1. **Prepare Input Files**
    - Partition function input file (e.g., `C:\QUANT\Partition-Sums\Input_File_data.txt`)
    - Reduced HITRAN data files for each molecule (e.g., `H2O.i`, `CO2.i`)
    - Measured FT-IR data file (e.g., `C:\FTIR_Data\MeasuredData.dat`)
    - Edit paths in `main_driver.m` as needed.

2. **MATLAB Setup**
    - Place all `.m` files from this repository in your working directory.
    - Ensure input files are accessible (correct paths).
    - Open MATLAB and navigate to the repository directory.

3. **Run the Main Program**
    ```matlab
    main_driver
    ```

4. **Outputs**
    - Transmittance and error data file (e.g., `Results_Transmittance.dat`)
    - Fitted coefficients and covariance matrix file (e.g., `Results_Coefficients.dat`)

## Subroutine Summaries

**QTofi.m**  
Reads partition function data from input files, storing it for use in temperature-dependent spectral calculations.

**INPUT.m**  
Processes HITRAN line data files, applying temperature and pressure corrections, and calculates contributions to the optical depth for each spectral line.

**INDAT.m**  
Loads measured wavenumber and transmittance values from a user-supplied file, filtering points to the desired spectral range.

**MRQMIN.m**  
Uses the Levenberg-Marquardt algorithm to optimize model parameters so calculated transmittance fits the measured data.

**OUTPT.m**  
Writes all results to output files: measured vs. modeled transmittance, fitting coefficients, error metrics, and covariance matrix.

## Revision Control

This repo is set up for future updates and troubleshooting:
- Each subroutine is modular and well-documented.
- Update any file and commit your changes for full revision history.
- Add new subroutines or input formats as needed.
