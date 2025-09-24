% MATLAB File: INPUT.m
% Purpose: Reads and processes HITRAN line data for each molecule.

function INPUT()
    global HitranInputFiles MoleculeIDs MinWavenumber MaxWavenumber NumLinesPerMolecule

    NumLinesPerMolecule = zeros(1, length(HitranInputFiles));
    MoleculeIDs = 1:length(HitranInputFiles);

    for i = 1:length(HitranInputFiles)
        filename = HitranInputFiles{i};
        if exist(filename, 'file')
            % Load HITRAN line data: expects columns [wn, S, gamma_air, gamma_self, E_lower, etc.]
            data = load(filename);

            % Filter lines for wavenumber range
            idx = (data(:,1) >= MinWavenumber) & (data(:,1) <= MaxWavenumber);
            filtered_data = data(idx, :);

            NumLinesPerMolecule(i) = size(filtered_data, 1);

            % Store filtered HITRAN data in a global variable (as needed)
            assignin('base', sprintf('HitranData_mol%d', i), filtered_data);
        else
            error(['HITRAN input file not found: ', filename]);
        end
    end
end
