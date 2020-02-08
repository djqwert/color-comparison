% Reset
clear;
clc;
close all;

addpath('./KFOLDCROSSVALIDATION/');
addpath('./TOOLS/');
addpath('./UTILITY/');
addpath('./ANFIS/');

target = CercaFIS();

save ../CREATE_NN/target.mat target;