% Vengono realizzate X = Max-Min+1 reti neurali. Per ciascuna rete neurale con N
% neuroni (Min <= N <= Max), si calcola l'errore sul training. Al termine di Y training, si
% calcola l'errore medio sul training con la rete neurale di N neuroni.
% Questo finché N == MAX.

% input = feature X samples
% target = 1 X samples
% others var = scalar
function R = Addestramento(input,target,MinHiddenLayer,...
                                        MaxHiddenLayer,AddestramentiPerRete)
    
    % Pre-allocazione matrice degli errori                                
    errors = zeros(AddestramentiPerRete,MaxHiddenLayer);
    
    % Aggiungi padding alle matrici (devono avere mod(*,100) = 0
    samples = size(target,2);
    
    % Prepara la matrice alla KFoldCV
    [input,target] = RealizzazioneMatriceKFoldCV(input,target,samples);
    
    disp('Inizio ricerca rete');
    for h = MinHiddenLayer:MaxHiddenLayer
        errors(:,h) = NuovaRete(input,target,samples,h,...
                                AddestramentiPerRete/2);
    end
    disp('Termine ricerca rete');
    
    R = errors(:,MinHiddenLayer:MaxHiddenLayer);
    
end