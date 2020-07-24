% Universidad de Costa Rica
% Dinamica de maquinas IM0429

clear variables
clc
close all

alfa = 0:0.1:359;
alfar = alfa*pi/180;
a = 0.5;
c = 10;
g = 9.81;
m1 = 5;
alfaPun = 50;
L = 1.2;
k = 0.07;
IManivela = 1/3*a^2*m1;
beta = asin(a*sin(alfar)/L);
betaPun = a*alfaPun*cos(alfar)./(L*cos(beta));
Ff = c*(-a*alfaPun.*sin(alfar)-L*betaPun.*sin(beta));

T = -a*(2*Ff.*sin(alfar+beta)-g*m1*cos(alfar).*cos(beta))./(2*cos(beta));
Resultado = calcularEnergiaVolanteInercia(T);
energia = Resultado.energia;
wprom = alfaPun;
I = energia/(k*wprom^2);

prom = mean(T);

TT = k*(T-mean(T))+mean(T);
promm = mean(TT);
x = [alfa(1) alfa(end)];
y = [promm promm];
plot(x,y,'-k','displayname','Valor promedio')
hold on
plot(alfa,T,'b-','linewidth',1.2,'displayname','Sin volante inercia')
hold on
plot(alfa,TT,'r-','linewidth',1.2,'displayname','Con volante inercia')
xlim([min(alfa) max(alfa)])
legend('boxoff')
legend('location','north')
xlabel('Angulo (°)')
ylabel('Torque (N m)')
title('Torque de entrada al mecanismo','fontweight','normal')
fprintf('El area bajo la curva (energia) de cada pulso es: \n')
Resultado.energiaPulso
fprintf('La energia acumulada en cada pulso es: \n')
Resultado.energiaAcumuladaPulso
fprintf(['La maxima energia acumulada es: ' num2str(Resultado.energia) ' \n'])
fprintf(['El momento de inercia del sistema rotor manivela debe ser: ' num2str(I)  '\n'])

IVolanteInercia = I-IManivela;

fprintf(['El momento de inercia del volante de inercia debe ser: ' num2str(IVolanteInercia)  '\n'])


