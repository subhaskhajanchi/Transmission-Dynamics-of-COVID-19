
clear all;
close all;

%% Sample size N
runs=50;

%% LHS MATRIX  %%

PIS_LHS=LHS_Call(1600*(1-25/100), 1600, 1600*(1+25/100), 0, runs,'unif'); %% min,baseline,max,std,run,distribution
betaS_LHS=LHS_Call(1.8326*(1-25/100), 1.8326, 1.8326*(1+25/100), 0, runs,'unif'); 
alphaA_LHS=LHS_Call(0.20*(1-25/100), 0.20, 0.20*(1+25/100), 0, runs,'unif'); 
alphaI_LHS=LHS_Call(0.45*(1-25/100), 0.45, 0.45*(1+25/100), 0, runs,'unif');
alphaH_LHS=LHS_Call(0.35*(1-25/100), 0.35, 0.35*(1+25/100), 0, runs,'unif');
delS_LHS=LHS_Call(0.1945*10.^(-4)*(1-25/100), 0.1945*10.^(-4), 0.1945*10.^(-4)*(1+25/100), 0, runs,'unif');
gammaE_LHS=LHS_Call((1./7)*(1-25/100), 1./7, (1./7)*(1+25/100), 0, runs,'unif');
delE_LHS=LHS_Call(0.1945*10.^(-4)*(1-25/100), 0.1945*10.^(-4), 0.1945*10.^(-4)*(1+25/100), 0, runs,'unif'); 
qA_LHS=LHS_Call(0.4110*(1-25/100), 0.4110, 0.4110*(1+25/100), 0, runs,'unif');
delA_LHS=LHS_Call(0.1945*10.^(-4)*(1-25/100), 0.1945*10.^(-4), 0.1945*10.^(-4)*(1+25/100), 0, runs,'unif');
xiA_LHS=LHS_Call(0.1738*(1-25/100), 0.1738, 0.1738*(1+25/100), 0, runs,'unif');
delI_LHS=LHS_Call(0.03*(1-25/100), 0.03, 0.03*(1+25/100), 0, runs,'unif');
xiI_LHS=LHS_Call(0.21*(1-25/100), 0.21, 0.21*(1+25/100), 0, runs,'unif'); 
gammaI_LHS=LHS_Call(0.1423*(1-25/100), 0.1423, 0.1423*(1+25/100), 0, runs,'unif');
delH_LHS=LHS_Call(0.1945*10.^(-4)*(1-25/100), 0.1945*10.^(-4), 0.1945*10.^(-4)*(1+25/100), 0, runs,'unif');
xiH_LHS=LHS_Call(0.21*(1-25/100), 0.21, 0.21*(1+25/100), 0, runs,'unif');
delR_LHS=LHS_Call(0.1945*10.^(-4)*(1-25/100), 0.1945*10.^(-4), 0.1945*10.^(-4)*(1+25/100), 0, runs,'unif');

% LHS MATRIX and PARAMETER LABELS................
%LHSmatrix=[m1_LHS a1_LHS alpha1_LHS alpha_LHS m2_LHS a2_LHS h_LHS c_LHS];
LHSmatrix=[PIS_LHS betaS_LHS alphaA_LHS alphaI_LHS alphaH_LHS delS_LHS gammaE_LHS delE_LHS qA_LHS delA_LHS xiA_LHS ...
    delI_LHS xiI_LHS gammaI_LHS delH_LHS xiH_LHS delR_LHS];

%% Save the workspace
save Model_LHS.mat;

