function R = EstrazioneCaratteristiche(Spettro)
    NumeroCaratteristiche = 12;
    [r,c] = size(Spettro);  %1269x421
    C = zeros(r,NumeroCaratteristiche);
    for i = 1:r
        C(i,:) = [  
                    min(Spettro(i,:)), 
                    max(Spettro(i,:)),
                    mean(Spettro(i,:)),
                    median(Spettro(i,:)),
                    skewness(Spettro(i,:)),
                    kurtosis(Spettro(i,:)),
                    meanabs(Spettro(i,:)),
                    mode(Spettro(i,:)),
                    var(Spettro(i,:)),
                    std(Spettro(i,:)),
                    % cov(Spettro(i,:)),
                    range(Spettro(i,:)),
                    iqr(Spettro(i,:)),
                    %rms(Spettro(i,:)),
                    %rssq(Spettro(i,:))
                    %meanfreq(M(:,i),128);
                    %medfreq(M(:,i),128);
                    %peak2peak(M(:,i));
                    %peak2rms(M(:,i));
                    %seqperiod(M(:,i));
                ];
    end
    R = C;
    disp('Estrazione caratteristiche completata');
    
end