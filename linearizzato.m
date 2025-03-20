% x1= Tair
% x2=Hair
% x3=Cair
% u1=Qc
% u2=gv
% u3=Cinj
% u4=Tout
% u5=Hout
% u6=Cout
%% Parameters
alpha1=0.7;
alpha2=10;
gamma=0.008;
LAI=2.6;
Ccap=30000;
h=7;
s=40709;
L=2450;
rb=150;
rho_air=1.225;
Cp_air=1003;
pgc=1.8*10^-3;
Irad=1380;
n_lamp=4536;        %% numero di lampade di calore
PE=110*n_lamp;
eta=0.92;

syms x1 x2 x3 u1 u2 u3 u4 u5 u6

Qsun=alpha1*Irad;
Qlamp=eta*PE;

Hair_sat=5.5638*exp(0.0572*x1);
epsilon=0.7584*exp(0.0518*x1);
Rn=0.86*(1-exp(-0.7*LAI))*(Qsun+PE);
rs=(82+570*exp(-gamma*Rn/LAI))*(1+0.023*(x1-20)^2);
Hcrop=Hair_sat+epsilon*rb/(2*LAI)*Rn/L;
ge=(2*LAI)/((1+epsilon)*rb+rs);

Qcov=alpha2*(x1-u4);
Qtrans=ge*L*(Hcrop-x2);
Qvent=u2*rho_air*Cp_air*(x1-u4);

RH_air=x2/Hair_sat;
Htrans=ge*(Hcrop-x2);

%gc = piecewise(x1 <= u4, 0, x1 > u4, pgc * (x1 - u4)^(1/3));
gc=pgc * (x1 - u4)^(1/3);
Hcov=gc*[0.2522*exp(0.0485*x1)*(x1-u4)-(Hair_sat-x2)];
Hvent=u2*(x2-Hcov);

Cass=2.2*10^-3*1/(1+0.42/x3)*(1-exp(-0.003*(Qsun+PE)));
Cvent=gc*(x3-u6);

% Punto di equilibrio
x_eq = [22, 60, 600*10^-6*1977];
u_eq = [0, 0.003, 0.015, 20, 13, 500*10^-6*1977];      
%% ODEs 
dxdt = zeros(3,1);
dxdt1 = 1/Ccap*(Qsun+Qlamp-Qcov-Qtrans+u1);
dxdt2 = 1/h*(Htrans-Hcov-Hvent);
dxdt3 = 1/h*(u3-Cass-Cvent);

%% CALCOLO JACOBIANO
vars = [x1, x2, x3];
inputs = [u1, u2, u3, u4, u5, u6];
% Calcolare la Jacobiana
A = jacobian([dxdt1, dxdt2, dxdt3], vars);

% Valutare la Jacobiana al punto di equilibrio
 A_eq = subs(A, [vars, inputs], [x_eq, u_eq]);
 A_eq = simplify(A_eq);

% Calcolo della matrice di ingresso B
B = jacobian([dxdt1, dxdt2, dxdt3], inputs);

% Valutare la matrice B al punto di equilibrio
B_eq = subs(B, [vars, inputs], [x_eq, u_eq]);
B_eq = simplify(B_eq);

% Conversione delle matrici simboliche in numeriche
A_eq = double(A_eq);
B_eq = double(B_eq);

%% SISTEMA LINEARIZZATO

% Calcolo dei valori propri della matrice A
eigenvalues = eig(A_eq);
disp('Matrice A:')
disp(A_eq)

% Visualizzare i valori propri
disp('Autovalori della matrice A:')
disp(eigenvalues)

% Calcolo della costante di tempo
% La costante di tempo è data da -1/Re(lambda)
% dove lambda è il valore proprio con la parte reale più negativa
real_parts = real(eigenvalues);
dominant_eigenvalue = max(real_parts);
disp('Autovalore dominante della matrice A:')
tau = -1 / dominant_eigenvalue;
disp(dominant_eigenvalue)

disp('Costante di tempo del sistema linearizzato:')
disp(tau)
