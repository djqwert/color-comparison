function [R1,R2] = AggiungiPadding(input,target)

    samples = size(input,2);
    val = mod(samples,100);
    if val ~= 0   % Aggiungi padding se i campioni non sono multipli di 10
        
        val = 100 - val;
        for i = 1:val
            pad = randi(samples);
            input = input(:,[1:end pad]);
            target = target(:,[1:end pad]);
        end
        
    end
    
    R1 = input;
    R2 = target;

end