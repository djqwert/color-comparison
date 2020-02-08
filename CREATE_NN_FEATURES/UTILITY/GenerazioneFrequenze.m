function [Vi,B,Ve,G,A,R] = GenerazioneFrequenze(Spettro)
    Vi =   Spettro(:,1:1:70);
    B =    Spettro(:,71:1:115);
    Ve =   Spettro(:,116:1:190);
    G =    Spettro(:,191:1:210);
    A =    Spettro(:,211:1:240);
    R =    Spettro(:,241:1:421); 
end