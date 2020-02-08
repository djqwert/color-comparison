% La funzione addestra la rete con il numero ottimo di neuroni.
function [R1,R2,R3] = AddestramentoRete(input,target,hidden,bucket)
    
    % Pre-allocazione matrice degli errori                                
    errors = zeros(bucket*2,1);
    samples = size(target,2);
    
    % Prepara la matrice alla KFoldCV
    [input,target] = RealizzazioneMatriceKFoldCV(input,target,samples);
    net = CostruzioneRete(hidden,samples);
    index = 1;
    
    for r = 1:2
        [input,target] = RotazioneMatrice(1,input,target);
        for i = 1:bucket
            [net,tr] = train(net,input,target);
            errors(index) = mean(tr.tperf); % Oppure tr.best_tperf
            [input,target] = RotazioneMatrice(0,input,target);
            index = index + 1;
        end
    end
        
    R1 = net;
    R2 = tr;
    
    R3 = mean(errors);
    
end