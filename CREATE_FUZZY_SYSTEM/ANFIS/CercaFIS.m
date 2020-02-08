function R = CercaFIS()

    % Importazione strutture
    load('./data.mat');
    disp('Importazione strutture da ''./data.mat'' completata');
    
    % Inizializzazione strutture
    MatriceErrore = zeros(20,10);
    D76 = target;
    
    warning('off','all');

    for e = 1:10
        disp(['ANFIS N.',num2str(e)]);
        [fisStruct.fis(e),MatriceErrore(:,e)] = AddestraANFIS(CoordinateLABMaster,target,D20);     
    end
    
    warning('on','all');
    
    %StampaDistribuzione(MatriceErrore,10);
    
    fis = fisStruct.fis(CercaReteOttima(MatriceErrore,1,10));
    writefis(fis,'./sugeno_fuzzy');
    R = evalfis(CreaInput(CoordinateLABMaster,D76)',fis)';

end