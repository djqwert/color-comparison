function R = FeaturesSelection(input,target)

    [r,c] = size(input);
    %selectedFeatures = zeros(maxNeurons-minNeurons+1,c);

    %for hiddenLayerSize = 5
        selectedFeatures = SelectFeatures(input,target,10);
    %end

    R = selectedFeatures;
    
    disp('Selezione caratteristiche completata');

end