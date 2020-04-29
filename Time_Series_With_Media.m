% Model Validation for daily new Cases
close all; clear all;
%Figure Size
x0=10;
y0=50;
width=800;
height=650;
set(gcf,'position',[x0,y0,width,height])
% Load Observed Data
OK=xlsread('Kerala.xlsx');
% Define Global parameters values
alphaA=0.20;
alphaI=0.45;
alphaH=0.35;
delS=(0.1945*0.0001);
delE=(0.1945*0.0001);
gammaE=1/7;
delA=(0.1945*0.0001);
delI=0.03;
xiI=0.21;
delH=(0.1945*0.0001);
delR=(0.1945*0.0001);
delM=0.0;
etaM=0.0;
dM=0.0;
alphaM=0.0;

%----------------- Kerala --------------------------------------------------
% Define other parameter values 
PIS=500;
betaS=2.6822;
qA=0.0028;
xiA=0.1121;
gammaI=0.0348;
xiH=0.2137;
delM=0.0;
etaM=0.0;
dM=0.0;
alphaM=0.0;
% Initial Population size
S=40000; E=8.0; A=1; I=1; H=1; R=1.0; M=0;
t=OK(:,1)';
[t,Y]=ode45(@(t,Y) ModelEq(t,Y,PIS,betaS,alphaA,alphaI,alphaH,delS,delE,gammaE,qA,delA,xiA,delI,xiI,gammaI,delH,xiH,delR,delM,etaM,dM,alphaM),t,[S;E;A;I;H;R;M]);

%----------- Solution with Media ------------------------------------------
%----------- Parameter Set - I --------------------------------------------
delM=0.06;
etaM=0.2;
dM=0.017;
alphaM=0.03;
t=OK(:,1)';
[t,YM1]=ode45(@(t,YM1) ModelEq(t,YM1,PIS,betaS,alphaA,alphaI,alphaH,delS,delE,gammaE,qA,delA,xiA,delI,xiI,gammaI,delH,xiH,delR,delM,etaM,dM,alphaM),t,[S;E;A;I;H;R;M]);
%----------- Parameter Set - II -------------------------------------------
etaM=0.8;
alphaM=0.03;
t=OK(:,1)';
[t,YM2]=ode45(@(t,YM2) ModelEq(t,YM2,PIS,betaS,alphaA,alphaI,alphaH,delS,delE,gammaE,qA,delA,xiA,delI,xiI,gammaI,delH,xiH,delR,delM,etaM,dM,alphaM),t,[S;E;A;I;H;R;M]);
%----------- Parameter Set - III -------------------------------------------
etaM=0.25;
alphaM=0.05;
t=OK(:,1)';
[t,YM3]=ode45(@(t,YM3) ModelEq(t,YM3,PIS,betaS,alphaA,alphaI,alphaH,delS,delE,gammaE,qA,delA,xiA,delI,xiI,gammaI,delH,xiH,delR,delM,etaM,dM,alphaM),t,[S;E;A;I;H;R;M]);
%----------- Parameter Set - IV -------------------------------------------
etaM=0.25;
alphaM=0.08;
t=OK(:,1)';
[t,YM4]=ode45(@(t,YM4) ModelEq(t,YM4,PIS,betaS,alphaA,alphaI,alphaH,delS,delE,gammaE,qA,delA,xiA,delI,xiI,gammaI,delH,xiH,delR,delM,etaM,dM,alphaM),t,[S;E;A;I;H;R;M]);

%--------------Plot for Kerala
% Plotting for cumulative Infected patients
YK(1)=Y(1,4);
for j=2:1:length(Y(:,4))
YK(j)=YK(j-1)+Y(j,4);    
end

Y4M1(1)=YM1(1,4);
for j=2:1:length(YM1(:,4))
Y4M1(j)=Y4M1(j-1)+YM1(j,4);    
end

Y4M2(1)=YM2(1,4);
for j=2:1:length(YM2(:,4))
Y4M2(j)=Y4M2(j-1)+YM2(j,4);    
end

Y4M3(1)=YM3(1,4);
for j=2:1:length(YM3(:,4))
Y4M3(j)=Y4M3(j-1)+YM3(j,4);    
end

Y4M4(1)=YM4(1,4);
for j=2:1:length(YM4(:,4))
Y4M4(j)=Y4M4(j-1)+YM4(j,4);    
end

%b=subplot(3,2,2)
%plot(OK(:,1),OK(:,3),'.r','MarkerSize',12); hold on
p0=plot(t,YK,'b','LineWidth',1.23); hold on;
p1=plot(t,Y4M1,'r','LineWidth',1.23);
p2=plot(t,Y4M2,'--r','LineWidth',1.23);
p3=plot(t,Y4M3,'g','LineWidth',1.23);
p4=plot(t,Y4M4,'--g','LineWidth',1.23);
axis([1 62 0 300])
h=[p0(1);p1;p2(1);p3;p4(1)];
legend(h,'\eta_m=0.0, \alpha_m=0.0','\eta_m=0.20, \alpha_m=0.03','\eta_m=0.80, \alpha_m=0.03','\eta_m=0.25, \alpha_m=0.05','\eta_m=0.25, \alpha_m=0.08','Location','northwest');
%xlabel('Days from January 30,2020','FontSize',8)
ylabel('Cumulative Confirmed Cases','FontSize',8)
set(gca,'xticklabel',[])
text(1,-30,'30/1/20','HorizontalAlignment', 'center','FontSize',8);
text(10,-30,'08/2/20','HorizontalAlignment', 'center','FontSize',8);
text(20,-30,'18/2/20','HorizontalAlignment', 'center','FontSize',8);
text(30,-30,'28/2/20','HorizontalAlignment', 'center','FontSize',8);
text(40,-30,'09/3/20','HorizontalAlignment', 'center','FontSize',8);
text(50,-30,'19/3/20','HorizontalAlignment', 'center','FontSize',8);
text(60,-30,'29/3/20','HorizontalAlignment', 'center','FontSize',8);
text(40,280,'Kerala');
