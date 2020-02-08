function [R1, R2] = RicercaReteOttima(input,output,hidden,...
                                            AddestramentiPerRete,Tentativi)
    disp('Inizio ricerca rete ottima');
    error = 1;
    for i = 1:Tentativi
        [net,tr,netError] = AddestramentoRete(input,output,hidden,...
                                                AddestramentiPerRete/2);
        disp(['Errore medio N.',num2str(i),': ',num2str(netError)]);
        if  netError < error
            R1 = net;
            R2 = tr;
            error = netError;
        end    
    end
    
    disp(['Errore medio migliore: ',num2str(error)]);

end