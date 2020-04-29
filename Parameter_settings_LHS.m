%%%%%%%%%%%%%%parameters%%%%%%%%%%%%%%%
%r=0.3; K=10; mu1=0.2; D1=0.005; D2=0.1;
PIS = 1600; betaS = 1.8326; alphaA = 0.20; alphaI = 0.45; alphaH = 0.35; delS = 0.1945*10.^(-4);
gammaE = 1./7; delE = 0.1945*10.^(-4); qA = 0.4110; delA = 0.1945*10.^(-4); xiA = 0.1738;
delI = 0.03; xiI = 0.21; gammaI = 0.1423; delH = 0.1945*10.^(-4); xiH = 0.21; delR = 0.1945*10.^(-4);

%% Parameter Labels 
PRCC_var={'PIS','betaS','alphaA','alphaI','alphaH','delS','gammaE','delE','qA','delA','xiA',...
'delI','xiI','gammaI','delH','xiH','delR',};% 
%PRCC_var={'m_1','a_1','\alpha_1', '\alpha', 'm_2', 'a_2', 'h', 'c'};% 
y0=[500000 5000 10 1.0 1.0 10];

tspan = 1:1:50;