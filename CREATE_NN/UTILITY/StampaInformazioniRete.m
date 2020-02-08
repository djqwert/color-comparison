function [] = StampaInformazioniRete(net,tr,input,t)
    
    disp('Stampa informazioni per rete migliore.');
    view(net);
    y = net(input);
    errors = gsubtract(t,y);
    figure; plotperform(tr);
    figure; plottrainstate(tr);
    figure; plotregression(t(:,tr.trainInd),y(:,tr.trainInd),'Training',t(:,tr.testInd),y(:,tr.testInd),'Testing',t,y,'All');
    figure; ploterrhist(errors(:,tr.trainInd),'Training',errors(:,tr.testInd),'Testing');
    
end