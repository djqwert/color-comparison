% Cestino

M = gendis(12);
[rows,cols] = size(M);
features = zeros(rows,cols);
nz = 1:cols;
for i = 1:rows
    z = find(~M(i,:));
    features(i,1:cols) = 1;
    features(i,z) = 0;
end
F = sortrows(features,nz);

features = size(input,2)/2;
    dis = gendis(features);
    dis = [dis dis];
    rows = size(dis,1);
    
    [input, target] = AggiungiPadding(input,target);
    errors = zeros(rows,1);
    
    features = [];
    for i = 1:rows
        features(i) = find(dis(i,:));
    end

dis = gendis(12);
M = [errors,dis(:,1:12)];
M = sortrows(M);
M = [errors,sum(dis(:,1:12),2),dis(:,1:12)];
M = sortrows([errors,sum(dis(:,1:12),2),dis(:,1:12)]);

    % Rumore
   %[r,c] = size(Spettro);
    %val = ones(1,c)*1/2;
    %for i = 1:r
        %for g = 1:c
        %    Media = mean(Spettro(i,:));
        %    if Spettro(i,g) > Media
                %value = 2*rand()-1/2;
                %Spettro(i,g) = Spettro(i,g) + value;
        %        Spettro(i,g) = smooth(Spettro(i,g));
        %    end
        %end
        %Spettro(i,:) = Spettro(i,:) + rand(1,c);
    %end

% rDSP = Rdsp(iDSP,ReflectanceCurve);
% rDSP = NormalizzaSegnale(rDSP);

% SpettroD1 = PuliziaSegnale(diff(rDSP,1,2)); RAWFeaturesMasterD1 = EstrazioneCaratteristiche(SpettroD1);
% SpettroD2 = PuliziaSegnale(diff(SpettroD1,1,2)); RAWFeaturesMasterD2 = EstrazioneCaratteristiche(SpettroD2);
% RAWFeaturesMaster = [RAWFeaturesMaster RAWFeaturesMasterD1 RAWFeaturesMasterD2];

% rDSPCopy = Rdsp(iDSP,ReflectanceCurveCopy);
% rDSPCopy = NormalizzaSegnale(rDSPCopy);

% SpettroD1 = PuliziaSegnale(diff(rDSPCopy,1,2)); RAWFeaturesCopyD1 = EstrazioneCaratteristiche(SpettroD1);
% SpettroD2 = PuliziaSegnale(diff(SpettroD1,1,2)); RAWFeaturesCopyD2 = EstrazioneCaratteristiche(SpettroD2);
% RAWFeaturesCopy = [RAWFeaturesCopy RAWFeaturesCopyD1 RAWFeaturesCopyD2];

% Potenza spettrale della sorgente luminosa
% iDSP = Idsp();



% Generazione vettore output ANN
% SogliaMassimaErrore = 2;
% [ANNTargetSfs, ANNTarget, Delta] = GenerateANNTarget(CoordinateLABMaster,CoordinateLABCopy,SogliaMassimaErrore);

RAW = [RAWFeaturesMaster RAWFeaturesCopy];
% ANNInput = RAW(:,Sfs(RAW,ANNTargetSfs));
ANNInput = RAW;
ANNTarget = Delta;
% Ordinamento matrici input e output
% ANNInput = [ANNInput ANNTargetSfs]; 
% [r,c] = size(ANNInput); 
% ANNInput = sortrows(ANNInput,c);
% ANNInput = ANNInput(:,1:(end-1));
% ANNTarget = sortrows([ANNTarget ANNTargetSfs],5); 
% ANNTarget = ANNTarget(:,1:4);

function [R, O, Delta] = GenerateANNTarget(LABMaster, LABCopy, Errore)
    R = (LABMaster - LABCopy);
    R = sqrt(sum(R .* R, 2));
    
    Delta = R;
    [r,c] = size(R);
    O = zeros(r,4);
    
    for i = 1:r
       if R(i) >= Errore
           R(i) = 4;
       elseif R(i) >= 0.5*Errore
           R(i) = 3;
       elseif R(i) >= 0.25*Errore
           R(i) = 2;
       else
           R(i) = 1;
       end
       O(i,R(i)) = 1;
    end
    
    disp('Generazione vettore ''Target'' completata');
end