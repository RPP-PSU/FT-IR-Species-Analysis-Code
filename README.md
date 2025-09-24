# FT-IR Species Analysis Code

This repository contains MATLAB code for quantitative analysis of FT-IR (Fourier-Transform Infrared) spectra, enabling the extraction of species concentrations and spectral fitting using HITRAN data and partition functions.

---

## Features

- **Automated GUI Input:**  
  A unified graphical user interface (GUI) launches automatically upon running the main driver. All required input files and numerical parameters are selected/entered through the GUI—no need to edit code to change settings!
- **Flexible Input:**  
  Select partition function files, HITRAN data files, measured FT-IR data, and output file destinations via the GUI.
- **Numerical Parameter Entry:**  
  Enter spectral range, temperature, pressure, and other parameters directly in the GUI.
- **Settings Persistence:**  
  Option to save your input selections for future runs.
- **Nonlinear Least Squares Fitting:**  
  Performs transmittance fitting with a Levenberg-Marquardt algorithm.
- **Modular Code Structure:**  
  Core routines are separated into subroutines for clarity and maintainability.

---

## Getting Started

### 1. **Clone or Download the Repository**

```sh
git clone https://github.com/RPP-PSU/FT-IR-Species-Analysis-Code.git
```

### 2. **Open MATLAB**

- Set the repository folder as your working directory.

### 3. **Run the Main Driver**

- In MATLAB, run:
  ```matlab
  main_driver
  ```

### 4. **Use the GUI to Select Inputs**

- The GUI will prompt you to:
  - Select your **Partition Function** file(s)
  - Select **HITRAN Data** file(s)
  - Select your **Measured FT-IR** data file
  - Set output file locations
  - Enter all numerical input parameters (wavenumber range, temperature, pressure, step size, etc.)
  - Choose whether to save your input settings for future runs

- Click **Run** in the GUI to start the analysis, or **Cancel** to abort.

---

## Repository Structure

```
FT-IR-Species-Analysis-Code/
│
├── main_driver.m          # Main script, launches GUI and orchestrates workflow
├── FTIR_Input_GUI.m       # GUI for all input file selection and parameter entry
├── global_variables.m     # Defines and initializes global variables
├── QTofi.m                # Loads partition function data
├── INPUT.m                # Loads and processes HITRAN line data
├── INDAT.m                # Loads measured FT-IR data
├── MRQMIN.m               # Nonlinear least squares fitting routine
├── OUTPT.m                # Output file writer
├── README.md              # This file
└── (other possible files)
```

## Requirements

- MATLAB R2018b or newer (for GUI compatibility)
- HITRAN-format input files and partition function data files
- Measured FT-IR data files in supported format (see comments in `INDAT.m`)

---

## License

This project is for research and educational use.
