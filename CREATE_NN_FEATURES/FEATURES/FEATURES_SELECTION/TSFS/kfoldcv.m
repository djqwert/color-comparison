% Funzione che dato l'input e il target addestra una rete con 2k-foldcv e
% ritorna l'errore sul test set.
function R = kfoldcv(input,target)

    % Pre-allocazione matrice degli errori
    errors = zeros(20,1);
    samples = size(target,2);
    
    % Prepara la matrice alla KFoldCV
    [input,target] = RealizzazioneMatriceKFoldCV(input,target,samples);
    net = CostruzioneRete(5,samples);
    index = 1;
    
    for r = 1:2
        [input,target] = RotazioneMatrice(1,input,target);
        for i = 1:10
            [net,tr] = train(net,input,target);
            errors(index) = mean(tr.tperf); % Oppure tr.best_tperf
            [input,target] = RotazioneMatrice(0,input,target);
            index = index + 1;
        end
    end
        
    R = mean(errors);

end