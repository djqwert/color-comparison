function R = NuovaRete(input,target,samples,hiddenNeurons,bucket)

    % Creazione vettore errori (in teoria 20, uno per ogni train(*))
    errors = zeros(bucket*2,1);
    disp(['Rete ',num2str(hiddenNeurons)]);
    net = CostruzioneRete(hiddenNeurons,samples);
    index = 1;
    
    % Si attiva la KFoldCrossValidation per due volte di seguito
    for r = 1:2
        
        % Si modificano la matrice per bene
        [input,target] = RotazioneMatrice(1,input,target);
        
        for i = 1:bucket
            [net,tr] = train(net,input,target);
            errors(index) = mean(tr.tperf); % Oppure tr.best_tperf
            
            % Si scombussalano le matrici per il prossimo training
            [input,target] = RotazioneMatrice(0,input,target);
            index = index + 1;
        end
    end

    R = errors;
    
end