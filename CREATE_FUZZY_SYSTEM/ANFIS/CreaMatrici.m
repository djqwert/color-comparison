function [R1,R2] = CreaMatrici(LAB,D76,D20)
    input = CreaInput(LAB,D76);
    target = D20;
    [input,target] = AggiungiPadding(input',target');
    [input,target] = RealizzazioneMatriceKFoldCV(input,target);
    R1 = input';
    R2 = target';
end