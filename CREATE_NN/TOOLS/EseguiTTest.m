% La funzione esegue il test di Studente sulle colonne della matrice
% successo S, assegnando il token (1) alla colonna ME con probabilità media 
% di successo(errore) maggiore(minore).
function R = EseguiTTest(S,ME,dim)
    disp('Inizio TTest.');
    M = zeros(dim,dim);
    for i = 1:1:dim
        for t = 1:1:dim
            r = ttest2(S(:,i),S(:,t));
            if(r == 1)
                if(ME(i) < ME(t))
                    M(t,i) = 1;
                end
            end
        end
    end
    disp('TTest terminato.');
    R = M;
end