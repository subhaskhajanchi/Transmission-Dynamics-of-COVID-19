% Time series solotions of the Model
close all; clear all;
% Load Observed Data of Kerala
O=xlsread('Kerala.xlsx');
% Define parameters values
PIS=500;
betaS=2.6822;
alphaA=0.20;
alphaI=0.45;
alphaH=0.35;
delS=(0.1945*0.0001);
delE=(0.1945*0.0001);
gammaE=1/7;
qA=0.0028;
delA=(0.1945*0.0001);
xiA=0.1121;
delI=0.03;
xiI=0.21;
gammaI=0.0348;
delH=(0.1945*0.0001);
xiH=0.2137;
delR=(0.1945*0.0001);
delM=0.0;
etaM=0.0;
dM=0.0;
alphaM=0.0;

% Initial Population size
S=40000; E=8.0; A=1; I=1; H=1; R=1.0; M=0;
t=O(:,1)';
[t,Y]=ode45(@(t,Y) ModelEq(t,Y,PIS,betaS,alphaA,alphaI,alphaH,delS,delE,gammaE,qA,delA,xiA,delI,xiI,gammaI,delH,xiH,delR,delM,etaM,dM,alphaM),t,[S;E;A;I;H;R;M]);
% plot

subplot(2,1,1)
plot(O(:,1),O(:,4),'.r','MarkerSize',12); hold on
plot(t,Y(:,4),'LineWidth',2);
%axis([0 61 0 175])
title('New Cases')

% Plotting for cumulative Symptomatic patients
i=0;
Y4(1)=Y(1,4);
for j=2:1:length(Y(:,4))
Y4(j)=Y4(j-1)+Y(j,4);    
end
subplot(2,1,2)
plot(O(:,1),O(:,3),'.r','MarkerSize',12);hold on
plot(t,Y4,'LineWidth',2)

title('Cumulative Confirmed Cases')
