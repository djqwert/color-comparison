% La funzione realizzare una twin sequential forward features selection a 
% due matrici di M colonne. La tsfs seleziona ad ogni
% iterazione le stesse colonne dell'una e dell'altra matrice.
function R = tsfs(input,target)
    
    disp('Twin sequential features selection iniziata.');
    features = size(input,2)/2;
    dis = gendis(features);
    dis = [dis,dis];
    rows = size(dis,1);
    
    [input, target] = AggiungiPadding(input,target);
    errors = zeros(rows,1);
    
    for i = 1:rows
        disp(i)
        features = find(dis(i,:));
        errors(i) = kfoldcv(input(:,features)',target');
    end
    
    % [minv,mini] = min(errors);
    % disp(['Criterio: ',num2str(minv)]);
    % disp('Vettore caratteristiche: ');
    disp('Twin sequential features selection terminata.');
    R = errors;
 
end