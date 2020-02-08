% La funzione ruota le tre matrici Ansia, Emozioni, Riposo. Se la variabile
% random = 0 le tre matrici sono shiftate staticamente. Altrimenti se
% random = 1, le tre matrici sono shiftate randomicamente per implementare
% correttamente la k-fold cross-validation.
function [R1,R2] = RotazioneMatrice(random,input,target)

    c = size(target,2);
    if random == 1
        j = randi([1 c],1,1);
    else
        j = 0;
    end
    c = c / 10;
    R1 = circshift(input,c+j,2)';
    R2 = circshift(target,c+j,2)';
end