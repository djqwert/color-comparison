function [R1,R2] = RealizzazioneMatriceKFoldCV(input,target,samples)
    
    % Splitto il sample set in 10 bucket
    blockDim = samples / 10;
    
    % Il test set è 30% del bucket, mentre il resto è train set
    testBlock = blockDim * 0.3;
    trainBlock = blockDim - testBlock;
    
    trainInd = zeros(1,trainBlock*10);
    testInd = zeros(1,testBlock*10);
    startBlock = 1;
    endBlock = blockDim;
    StartTrainBlock = 1;
    StartTestBlock = 1;
    
    for i = 1:10
        trainInd(:,StartTrainBlock:((blockDim-testBlock)*i)) = startBlock:(endBlock - testBlock);
        testInd(:,StartTestBlock:(blockDim-trainBlock)*i) = (endBlock - testBlock + 1):endBlock;
        StartTrainBlock = (blockDim-testBlock)*i+1;
        StartTestBlock = (blockDim-trainBlock)*i+1;
        startBlock = startBlock + blockDim;
        endBlock = endBlock+blockDim; 
    end
    
    R1 = input(:,[trainInd testInd]);
    R2 = target(:,[trainInd testInd]);
    
end