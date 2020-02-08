function R = Criterion(input,target,hidden)    

    input = input';
    target = target';
   
    net = fitnet(hidden(1,1),'trainscg');
    
    net.divideParam.trainRatio = 70/100;
    net.divideParam.testRatio = 30/100;
    net.divideParam.valRatio = 0;
    % net.performFcn = "mse"; % default func
    net.trainParam.showWindow = 0;
    
    [net,tr] = train(net,input,target);
    
    output = net(input);

    testInd = tr.testInd;
    testTarget = target(:,testInd);
    testOutput = output(:,testInd);

    R = perform(net,testTarget,testOutput);

end