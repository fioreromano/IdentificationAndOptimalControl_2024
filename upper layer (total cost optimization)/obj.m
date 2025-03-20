function y =obj(u)
%% STRATEGIA 1
% la prima strategia sta nel considerare solo il primo ingresso di
% controllo in particolare minimizziamo Qc 
%y1=sum((u(1,:)).^2);
%y2=0;
%y3=0;
%% STRATEGIA 2  
% l'ingresso di controllo Qc viene moltiplicato per il prezzo della
% corrente che è diviso per fasce orarie: per esempio gli ingressi da 1 a
% 72 sono le prime 6 ore (da 0:00 a 6:00) e le ultime due (da 22:00 a 24:00) e costano 0.5157
%y1=1/12*100*40709/1000*((sum(abs(u(1,1:72)))+sum(abs(u(1,265:288))))*0.5157+(sum(abs(u(1,109:204)))+sum(abs(u(1,229:264))))*0.9446+(sum(abs(u(1,73:108)))+sum(abs(u(1,205:228))))*3.1047);
%y2=0;
%y3=0;

%% STRATEGIA 3
% l'ingresso di controllo Qc viene moltiplicato per il prezzo della
% corrente che è diviso per fasce orarie: per esempio gli ingressi da 1 a
% 72 sono le prime 6 ore (da 0:00 a 6:00) e le ultime due (da 22:00 a 24:00) e costano 0.5157
y1=1/12*40709/1000*((sum(abs(u(1,1:72)))+sum(abs(u(1,265:288))))*0.5157+(sum(abs(u(1,109:204)))+sum(abs(u(1,229:264))))*0.9446+(sum(abs(u(1,73:108)))+sum(abs(u(1,205:228))))*3.1047);
% 300W è la potenza di ogni ventola, 5000 è il flusso m^3 ogni ora,
% lambda=0.06 tasso di conversione da gv alla potenza Qv
y2=300*40709/(5000/0.3)*((sum(u(2,1:72))+sum(u(2,265:288)))*0.5157+(sum(u(2,109:204))+sum(u(2,229:264)))*0.9446+(sum(u(2,73:108))+sum(u(2,205:228)))*3.1047);

%y2=sum(u(2,:))*300*40709/47838;
% pc è il prezzo della co2 = 1000/tonnellata

y3=sum(u(3,:))*300*40709*10^-6*1000;

%% STRATEGIA 4
%coef1=1;
%coef2=1;
%coef3=100; %pesiamo di più Cinj
%y1=coef1*(1/12*40709/1000*((sum(abs(u(1,1:72)))+sum(abs(u(1,265:288))))*0.5157+(sum(abs(u(1,109:204)))+sum(abs(u(1,229:264))))*0.9446+(sum(abs(u(1,73:108)))+sum(abs(u(1,205:228))))*3.1047));
%y2=coef2*(sum(u(2,:))*300*40709/47838);
%y3=coef3*(sum(u(3,:))*300*40709*10^-6*1000);
%% STRATEGIA 4 modificata

%y1=(1/12*40709/1000*((sum(abs(u(1,1:72)))+sum(abs(u(1,265:288))))*0.5157+(sum(abs(u(1,109:204)))+sum(abs(u(1,229:264))))*0.9446+(sum(abs(u(1,73:108)))+sum(abs(u(1,205:228))))*3.1047));
%y2=300*40709/(5000/0.3)*((sum(u(2,1:72))+sum(u(2,265:288)))*0.5157+(sum(u(2,109:204))*0.0+sum(u(2,229:264)))*0.9446+(sum(u(2,73:108))+sum(u(2,205:228)))*3.1047);
%y3=(sum(u(3,:))*300*40709*10^-6*1000);

y=y1+y2+y3;
end
