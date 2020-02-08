function [R1,R2] = AddestraANFIS(LAB,D76,D20)

    [input,target] = CreaMatrici(LAB,D76,D20);
    [fis, options, trainInd, testInd] = CostruzioneANFIS(size(target,1));
    errors = zeros(20,1);
    index = 1;

    for r = 1:2
        [input,target,train,test] = kfoldcv(1,input,target,trainInd,testInd);        
        for i = 1:10
            fis = anfis(train,options);
            testError = evalfis(test(:,1:4),fis);
            % errors(index) = abs(mean(test(:,5) - testError));
            errors(index) = immse(test(:,5),testError);
            options.InitialFIS = fis;
            [input,target,train,test] = kfoldcv(0,input,target,trainInd,testInd);   
            index = index + 1;    
        end
    end
    
    R1 = fis;
    R2 = errors;    
    
end