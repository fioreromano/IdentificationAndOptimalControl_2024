function y =obj2(u)
%% STRATEGIA 4
coef1=100; %pesiamo QC
coef2=1;
coef3=1;
y1=coef1*(1/12*40709/1000*((sum(abs(u(1,1:72)))+sum(abs(u(1,265:288))))*0.5157+(sum(abs(u(1,109:204)))+sum(abs(u(1,229:264))))*0.9446+(sum(abs(u(1,73:108)))+sum(abs(u(1,205:228))))*3.1047));
y2=coef2*(sum(u(2,:))*300*40709/47838);
y3=coef3*(sum(u(3,:))*300*40709*10^-6*1000);
y=y1+y2+y3;
end
