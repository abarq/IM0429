% Universidad de Costa Rica
% IM0429 Dinamica de maquinas

clear variables
clc
close all

syms a Bx alfa By Ay Ax T I2 alfa2p m1 m2 g L beta N alfap FF beta2p x2p y2p

eq1 = a/2*sin(alfa)*Bx +a/2*cos(alfa)*By-Ay*a/2*cos(alfa)-Ax*a/2*sin(alfa)+T;
eq2 = By-m1*g+Ay-m1*(-a/2*alfap^2*sin(alfa));
eq3 = -Bx-Ax-m1*(-a/2*alfap^2*cos(alfa));
eq4 = L/2*Bx*sin(beta)-L/2*By*cos(beta)-N*L/2*cos(beta)+FF*L/2*sin(beta);
eq5 = Bx-FF;
eq6 = N-By;

S = solve([eq1 eq2 eq3 eq4 eq5 eq6], [Ax Ay Bx By N T]);
S.T

