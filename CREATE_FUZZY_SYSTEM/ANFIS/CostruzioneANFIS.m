function [R1,R2,R3,R4] = CostruzioneANFIS(samples)
    % Indici per KFoldCV
    testInd = samples * 0.3;
    trainInd = samples - testInd;
    % Converti FIS mamdani a sugeno
    fis = readfis('./mamdani_fuzzy.fis');
    fis = MamToSug(fis); 
    % Opzioni ANFIS
    options = anfisOptions;
    options.InitialFIS = fis;
    options.EpochNumber = 1;
    options.DisplayANFISInformation = 0;
    options.DisplayErrorValues = 0;
    options.DisplayStepSize = 0;
    options.DisplayFinalResults = 0;
    options.ValidationData = [];
    R1 = fis;
    R2 = options;
    R3 = trainInd;
    R4 = testInd;
end