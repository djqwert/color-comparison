function R = Cwf()
    % Luminosità 65 e osservatore 10 perché usati nell'industria della stampa 
    % cwf = color weight function
    % D65cwf = makecwf('D65/2',380:1:800,'astm','first','SpectrumType','uncompensated');
    % Poiché qualche routine è buggata, il cwf è realizzata da 360 a 830
    % D65cwf.weights = D65cwf.weights(5:1:89,:);
    % D65cwf.wl = D65cwf.wl(:,5:1:89);
    disp('Color matching functions realizzata e fixata');
    R = 'D65/2';
end