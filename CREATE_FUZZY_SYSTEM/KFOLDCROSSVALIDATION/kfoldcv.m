function [R1,R2,R3,R4] = kfoldcv(ran,input,target,trainInd,testInd)

    samples = size(target,1);

    [input,target] = RotazioneMatrice(ran,input',target');
    input(:,5) = target;
    train = input(1:trainInd,:);
    test = input((samples-testInd):end,:);

    R1 = input;
    R2 = target;
    R3 = train;
    R4 = test;

end