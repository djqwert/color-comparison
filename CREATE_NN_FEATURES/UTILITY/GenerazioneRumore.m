function R = GenerazioneRumore(Spettro) % Vi,B,Ve,G,A,R
    [Vi,B,Ve,G,A,R] = GenerazioneFrequenze(Spettro);
    % Creazione rumore
    [row,col] = size(Vi);
    Vi = Vi+rand(row,1)*0.001+0.01;
    B = B+rand(row,1)*0.001+0.01;
    Ve = Ve+rand(row,1)*0.001+0.01;
    G = G+rand(row,1)*0.001+0.01;
    A = A+rand(row,1)*0.001+0.01;
    R = R+rand(row,1)*0.001+0.01;
    R = [Vi,B,Ve,G,A,R];
    disp('Generazione copia completata');
end