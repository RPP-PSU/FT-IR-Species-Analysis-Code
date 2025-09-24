% MATLAB File: OUTPT.m
% Purpose: Writes results to output files: fitted coefficients, covariance matrix, measured vs modeled transmittance.

function OUTPT()
    global OutputFilePath1 OutputFilePath2
    global WavenumberData MeasuredTransmittance CalculatedTransmittance
    global CoefficientArray CovarianceMatrix

    % Write measured and calculated transmittance to file
    fid1 = fopen(OutputFilePath1, 'w');
    fprintf(fid1, 'Wavenumber\tMeasured\tCalculated\n');
    for i = 1:length(WavenumberData)
        fprintf(fid1, '%.4f\t%.6f\t%.6f\n', WavenumberData(i), MeasuredTransmittance(i), CalculatedTransmittance(i));
    end
    fclose(fid1);

    % Write coefficients and covariance matrix to file
    fid2 = fopen(OutputFilePath2, 'w');
    fprintf(fid2, 'Fitted Coefficients:\n');
    for i = 1:length(CoefficientArray)
        fprintf(fid2, 'Coeff %d: %.6e\n', i, CoefficientArray(i));
    end
    fprintf(fid2, '\nCovariance Matrix:\n');
    for i = 1:size(CovarianceMatrix,1)
        fprintf(fid2, '%s\n', sprintf('%.6e\t', CovarianceMatrix(i,:)));
    end
    fclose(fid2);

    disp('Results written to output files.');
end
