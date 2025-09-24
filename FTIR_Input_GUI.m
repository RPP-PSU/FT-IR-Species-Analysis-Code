% MATLAB File: FTIR_Input_GUI.m
% Purpose: Provides a unified GUI for selecting input/output files and entering parameters for FT-IR Species Analysis.

function params = FTIR_Input_GUI()

    params = struct();

    % Create main GUI window
    fig = uifigure('Name', 'FT-IR Analysis Input Setup', 'Position', [100 100 500 500]);

    % Partition function input file
    lblPart = uilabel(fig, 'Position', [20 440 200 22], 'Text', 'Partition Function Input File:');
    btnPart = uibutton(fig, 'Position', [350 440 120 22], 'Text', 'Browse...', ...
        'ButtonPushedFcn', @(btn,event) selectFile('Partition Function', btnPart, 'params.PartitionFile'));

    % HITRAN data file
    lblHitran = uilabel(fig, 'Position', [20 400 200 22], 'Text', 'HITRAN Data File:');
    btnHitran = uibutton(fig, 'Position', [350 400 120 22], 'Text', 'Browse...', ...
        'ButtonPushedFcn', @(btn,event) selectFile('HITRAN Data', btnHitran, 'params.HitranFile'));

    % Measured FT-IR data file
    lblMeas = uilabel(fig, 'Position', [20 360 200 22], 'Text', 'Measured FT-IR Data File:');
    btnMeas = uibutton(fig, 'Position', [350 360 120 22], 'Text', 'Browse...', ...
        'ButtonPushedFcn', @(btn,event) selectFile('Measured Data', btnMeas, 'params.MeasuredFile'));

    % Output: Transmittance file
    lblOut1 = uilabel(fig, 'Position', [20 320 200 22], 'Text', 'Output: Transmittance File:');
    btnOut1 = uibutton(fig, 'Position', [350 320 120 22], 'Text', 'Browse...', ...
        'ButtonPushedFcn', @(btn,event) selectSaveFile('Transmittance Output', btnOut1, 'params.OutputTrans'));

    % Output: Coefficient file
    lblOut2 = uilabel(fig, 'Position', [20 280 200 22], 'Text', 'Output: Coefficient File:');
    btnOut2 = uibutton(fig, 'Position', [350 280 120 22], 'Text', 'Browse...', ...
        'ButtonPushedFcn', @(btn,event) selectSaveFile('Coefficient Output', btnOut2, 'params.OutputCoeff'));

    % Numeric input fields
    lblMinWN = uilabel(fig, 'Position', [20 240 150 22], 'Text', 'Min Wavenumber (cm^-1):');
    editMinWN = uieditfield(fig, 'numeric', 'Position', [200 240 80 22], 'Value', 600);

    lblMaxWN = uilabel(fig, 'Position', [20 200 150 22], 'Text', 'Max Wavenumber (cm^-1):');
    editMaxWN = uieditfield(fig, 'numeric', 'Position', [200 200 80 22], 'Value', 2400);

    lblTemp = uilabel(fig, 'Position', [20 160 150 22], 'Text', 'Temperature (K):');
    editTemp = uieditfield(fig, 'numeric', 'Position', [200 160 80 22], 'Value', 296);

    lblPres = uilabel(fig, 'Position', [20 120 150 22], 'Text', 'Total Pressure (atm):');
    editPres = uieditfield(fig, 'numeric', 'Position', [200 120 80 22], 'Value', 1.0);

    lblStep = uilabel(fig, 'Position', [20 80 150 22], 'Text', 'Integration Step Size (cm^-1):');
    editStep = uieditfield(fig, 'numeric', 'Position', [200 80 80 22], 'Value', 0.01);

    % Save settings checkbox
    chkSave = uicheckbox(fig, 'Position', [20 40 200 22], 'Text', 'Save settings for future runs');

    % Status label
    lblStatus = uilabel(fig, 'Position', [20 10 300 22], 'Text', '');

    % Run and Cancel buttons
    btnRun = uibutton(fig, 'Position', [350 40 70 30], 'Text', 'Run', ...
        'ButtonPushedFcn', @(btn,event) onRun());
    btnCancel = uibutton(fig, 'Position', [430 40 70 30], 'Text', 'Cancel', ...
        'ButtonPushedFcn', @(btn,event) onCancel());

    % Wait for user input
    uiwait(fig);

    % Nested callback functions
    function selectFile(fileType, btn, fieldName)
        [file, path] = uigetfile('*.*', ['Select ', fileType, ' File']);
        if isequal(file,0)
            return;
        end
        btn.Text = file;
        params.(fieldName) = fullfile(path, file);
    end

    function selectSaveFile(fileType, btn, fieldName)
        [file, path] = uiputfile('*.*', ['Select ', fileType, ' Output File']);
        if isequal(file,0)
            return;
        end
        btn.Text = file;
        params.(fieldName) = fullfile(path, file);
    end

    function onRun()
        % Gather numeric inputs
        params.MinWavenumber = editMinWN.Value;
        params.MaxWavenumber = editMaxWN.Value;
        params.Temperature   = editTemp.Value;
        params.TotalPressure = editPres.Value;
        params.IntegrationStepSize = editStep.Value;
        params.SaveSettings = chkSave.Value;
        % Close GUI
        uiresume(fig);
        close(fig);
    end

    function onCancel()
        params = [];
        uiresume(fig);
        close(fig);
    end
end
