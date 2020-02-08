function R = FeaturesNormalize(M)
    %len = size(M,2);
    %for i = 1:len
        %minR = min(M(:,i));
        %maxR = max(M(:,i));
        %M(:,i) = (M(:,i) - minR) ./ (maxR - minR);
    %    M = normalize(M);
    %end
    %R = (M - minR) ./ (maxR - minR);
    R = normalize(M);
end