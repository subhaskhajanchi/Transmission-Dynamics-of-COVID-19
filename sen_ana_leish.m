%% The results should be compared to the PRCC results section in
%% Supplementary Material D and Table D.1 for different N (specified by
%% "runs" in the script below
clear all;
close all;
load Model_LHS.mat
% parameters;
%% LHS MATRIX  %%
Parameter_settings_LHS;




%% LHS MATRIX and PARAMETER LABELS


for x=1:1:50 %Run solution x times choosing different values
    
%%% Initial Condition 
PIS6 = PIS_LHS(x);
betaS6 = betaS_LHS(x);
alphaA6 = alphaA_LHS(x);
alphaI6 = alphaI_LHS(x);
alphaH6 = alphaH_LHS(x);
delS6 = delS_LHS(x);
gammaE6 = gammaE_LHS(x);
delE6 = delE_LHS(x);
qA6 = qA_LHS(x);
delA6 = delA_LHS(x);
xiA6 = xiA_LHS(x);
delI6 = delI_LHS(x);
xiI6 = xiI_LHS(x);
gammaI6 = gammaI_LHS(x);
delH6 = delH_LHS(x);
xiH6 = xiH_LHS(x);
delR6 = delR_LHS(x);

% m13=m1_LHS(x);
% a13=a1_LHS(x);
% alpha13=alpha1_LHS(x);
% alpha3=alpha_LHS(x);
% m23=m2_LHS(x);
% a23=a2_LHS(x);
% h3=h_LHS(x);
% c3=c_LHS(x);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

param=[PIS6;betaS6;alphaA6;alphaI6;alphaH6;delS6;gammaE6;delE6;qA6;delA6;xiA6;delI6;xiI6;gammaI6;delH6;xiH6;delR6];
%param=[m13;a13;alpha13;alpha3;m23;a23;h3;c3];

[time,y1] = ode15s(@stage_ode,tspan,y0,[],param);

x1 = y1(:,1);
x2 = y1(:,2);
x3 = y1(:,3);
x4 = y1(:,4);
x5 = y1(:,5);
x6 = y1(:,6);

PIS6 = param(1);
betaS6 = param(2);
alphaA6 = param(3);
alphaI6 = param(4);
alphaH6 = param(5);
delS6 = param(6);
gammaE6 = param(7);
delE6 = param(8);
qA6 = param(9);
delA6 = param(10);
xiA6 = param(11);
delI6 = param(12);
xiI6 = param(13);
gammaI6 = param(14);
delH6 = param(15);
xiH6 = param(16);
delR6 = param(17);

% m13 = param(1);
% a13 = param(2);
% alpha13 = param(3);
% alpha3 = param(4);
% m23 = param(5);
% a23 = param(6);
% h3 = param(7);
% c3 = param(8);

%w_adult = PIS6 - ((betaS6.*x1.*(alphaA6.*x3+alphaI6.*x4+alphaH6.*x5))./(x1+x2+x3+x4+x5+x6)) -delS6.*x1;
%w_adult = ((betaS6.*x1.*(alphaA6.*x3+alphaI6.*x4+alphaH6.*x5))./(x1+x2+x3+x4+x5+x6)) -(gammaE6+delE6).*x2;
%w_adult = (1-qA6).*gammaE6.*x2 - (delA6+xiA6).*x3;
w_adult = qA6.*gammaE6.*x2 - (delI6+xiI6+gammaI6).*x4;
%w_adult = mu1.*v-D2.*w-h3.*w./(c3+w);

L=length(time);
New_cases=zeros(L,1);
New_cases(1)= y1(1,6);

for j=1:(L-1)
   New_cases(j+1)=trapz(w_adult(j:j+1));    
end
 I_adult(x)=mean(New_cases);
%   I_area(x)= trapz(New_cases);
 end
% [prcc_max sign_max]=PRCC(LHSmatrix,Imax,1,PRCC_var,0.05);
% [prcc_area sign_area]=PRCC(LHSmatrix,I_area,1,PRCC_var,0.05);
[prcc_I_adult sign sign_I_adult]=PRCC(LHSmatrix,I_adult,1,PRCC_var,0.03);

figure;
bar(prcc_I_adult,'FaceColor',[0 .5 .5],'EdgeColor',[0 .5 .5],'LineWidth',0.3)
set(gca,'xtick',1:17)
set(gca,'xticklabel',PRCC_var)
ylabel('PRCC');

axis([0 18 -1.0 1.0])
grid(gca, 'minor')

