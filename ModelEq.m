function Yprime=ModelEq(t,Y,PIS,betaS,alphaA,alphaI,alphaH,delS,delE,gammaE,qA,delA,xiA,delI,xiI,gammaI,delH,xiH,delR,delM,etaM,dM,alphaM);
Yprime=[PIS - (betaS*Y(1)*(alphaA*Y(3)+alphaI*Y(4)+alphaH*Y(5))/(Y(1)+Y(2)+(3)+Y(4)+Y(5)+Y(6)))-delS*Y(1)-etaM*dM*Y(1)*Y(7);...
        (betaS*Y(1)*(alphaA*Y(3)+alphaI*Y(4)+alphaH*Y(5))/(Y(1)+Y(2)+(3)+Y(4)+Y(5)+Y(6)))-delE*Y(2)-gammaE*Y(2);...
		(1-qA)*gammaE*Y(2)-delA*Y(3)-xiA*Y(3);...
		qA*gammaE*Y(2)-delI*Y(4)-xiI*Y(4)-gammaI*Y(4);...
		gammaI*Y(4)-delH*Y(5)-xiH*Y(5);...
		xiA*Y(3)+xiI*Y(4)+xiH*Y(5)-delR*Y(6)+etaM*delM*Y(1)*Y(7);...
		alphaM*Y(4)-dM*Y(7)];