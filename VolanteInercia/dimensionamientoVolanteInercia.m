% Universidad de Costa Rica
% IM0429 Dinamica de maquinas

clear variables
clc
close all

e = (0.01:0.001:0.05);
I = 0.287;
rho = 7850;
ri = 0.01;
r0 = (2*I./(pi*e*rho) + ri^4).^(1/4);
yyaxis right
plot(e,r0,'linewidth',1.2)
hold on
ylabel('Radio del volante (m)')
m = pi*rho*e.*(r0.^2-ri^2);
yyaxis left
plot(e,m,'linewidth',1.2)
xlabel('Espesor (m)')
ylabel('Masa del volante (kg)')