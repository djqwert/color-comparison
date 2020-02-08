% Percorsi interni
addpath('./FEATURES/');
addpath('./FEATURES/FEATURES_EXTRACTION/');
addpath('./FEATURES/FEATURES_SELECTION/');
addpath('./FEATURES/FEATURES_SELECTION/SQFS');
addpath('./TOOLS/');
addpath('./UTILITY/');

% Reset
clear;
clc;
close all;

% Importazione strutture
load('./IS_dataset.mat');
disp('Importazione strutture da ''./IS_dataset.mat'' completata');

% Inizializzazione strutture
[CoordinateRGB, CoordinateLAB] = CoordinateColore(coordinates);
clearvars coordinates;

% Curva di riflettanza
ReflectanceCurve = spectra';
clearvars spectra;

% Generazione coordinate colore
D65cwf = Cwf();
CoordinateLABMaster = roo2lab(ReflectanceCurve(:,1:end) .* 100,D65cwf,380:800);

% Estrazione caratteristiche master
RAWFeaturesMaster = EstrazioneCaratteristiche(ReflectanceCurve);

% Generazione copia
ReflectanceCurveCopy = GenerazioneRumore(ReflectanceCurve);

% Generazione coordinate LAB della copia
CoordinateLABCopy = roo2lab(ReflectanceCurveCopy(:,1:end) .* 100,D65cwf,380:800);

% Generazione caratteristiche copia
RAWFeaturesCopy = EstrazioneCaratteristiche(ReflectanceCurveCopy);

% Generazione vettore INPUT/OUTPUT ANN
RAWFeatures = FeaturesNormalize([RAWFeaturesMaster RAWFeaturesCopy]);
target = de(CoordinateLABMaster,CoordinateLABCopy);

% Delta-E CIE 2000
D20 = de2000(CoordinateLABMaster,CoordinateLABCopy);

% Feature selection
% Versione 1: 
Features = FeaturesSelection(RAWFeatures,target);
% Versione 2: MatriceErrori = tsfs(RAWFeatures,target); % inizialmente non
% c'era 'MatriceErrori', ma 'features'. Il subset di feature ottimali vanno
% selezionate a mano ...
% FeaturesMaster = RAWFeatures(:,features);
% FeaturesCopy = RAWFeatures(:,13:24); FeaturesCopy = FeaturesCopy(:,features);
% input = [FeaturesMaster,FeaturesCopy]';

%load('Features12.mat');
input = RAWFeatures(:,Features);
target = target';

% Salvataggio dati
%save ./data.mat input target CoordinateLABMaster D20 RAWFeatures Features;
%save ../CREATE_NN/data.mat input target D20 RAWFeatures Features;
%save ../CREATE_FUZZY_SYSTEM/data.mat input target CoordinateLABMaster D20 RAWFeatures Features;