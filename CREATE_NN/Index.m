% Percorsi interni
addpath('./KFOLDCROSSVALIDATION/');
addpath('./NEURAL_NETWORK/');
addpath('./NEURAL_NETWORK/SEARCH_NN/');
addpath('./NEURAL_NETWORK/TRAIN_BEST_NN/');
addpath('./TOOLS/');
addpath('./UTILITY/');

% Reset
clear;
clc;
close all;

%%%%%%%%%
load('Features4-1.mat');   % Classi di output per data set in ingresso alla net
load('target.mat');
% input = RAWFeatures(:,Features)'; % 
input = input';
r = size(input,1);
%%%%%%%%%

%%%%% Variabili da configurare
    MinHiddenNeurons = 2;           % Numero min di neuroni della rete
    MaxHiddenNeurons = 2 * r;       % Numero max di neuroni della rete
    dim = MaxHiddenNeurons-MinHiddenNeurons+1;
    AddestramentiPerRete = 20;      % Numero di train per ANN
    Tentativi = 10;                 % Tentativi di ricerca per la rete col 
                                    % numero ottimale di neuroni
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[input,target] = AggiungiPadding(input,target);

% Addestra reti con numero di neuroni variabile e registra gli errori
MatriceErrori = Addestramento(input,target,MinHiddenNeurons,...
                                    MaxHiddenNeurons,AddestramentiPerRete);

% StampaDistribuzione(MatriceErrori,dim);   
                                
% Si cerca la rete con il numero di neuroni che produce l'errore minore
Neuroni = CercaReteOttima(MatriceErrori,MinHiddenNeurons,dim);

% Si ricerca la rete che ottiene il miglior risultato
[net,tr] = RicercaReteOttima(input,target,8,AddestramentiPerRete,Tentativi);

% Stampa informazioni rete
StampaInformazioniRete(net,tr,input,target);