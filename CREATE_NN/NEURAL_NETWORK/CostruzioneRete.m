% La funzione setta le impostazioni di default per la rete artificiale.
function R = CostruzioneRete(n,samples)

    % Indici per implementare la KFoldCrossValidation
    % Il sample set è diviso in 10 bucket.
    % Tre decimi del bucket è utilizzato per il test set, il resto per il
    % training set della rete.
    testInd = samples * 0.3;
    trainInd = samples - testInd;
    
    net = fitnet(n,'trainbr');
    net.trainParam.showWindow = false;
    net.divideFcn = 'divideind';
    net.divideParam.trainInd = 1:trainInd;
    net.divideParam.testInd  = (samples-testInd):samples;
    net.divideParam.valInd   = [];
    net.performFcn = 'mse';
    R = net;
    
end