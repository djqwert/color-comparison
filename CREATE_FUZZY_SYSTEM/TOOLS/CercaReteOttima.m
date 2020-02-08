% La funzione cerca il numero di neuroni ottimo per addestrare la rete
% neurale.
function R = CercaReteOttima(MatriceErrori,Min,dim)
    
    disp('Ricerca numero neuroni ottimo.');

    MatriceErroreMedio = mean(MatriceErrori,1);
    MatriceSuccesso = 1 - MatriceErrori;
    MatriceTTest = EseguiTTest(MatriceSuccesso,MatriceErroreMedio,dim);
    MatriceTTestR = Conta1(MatriceTTest,dim);

    [Max,MaxI] = max(MatriceTTestR);
    R = MaxI+Min-1;
    if Max == 0
        disp('Il test di Student è negativo.');
        [Min,MinI] = min(MatriceErroreMedio);
        R = MinI;
    end
    
    disp(['Rete ottima: ',num2str(R)]);

end