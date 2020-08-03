% Universidad de Costa Rica
% Dinamica maquinas IM0429

clear variables
clc
close all

MasaCarga = 500;  % kg 
M = MasaCarga/2;  % kg 
L = 1.5;    % m
L1 = 0.5;   % m
L2 = 1.2;   % m 
a = 0.8;    % m
b = 1.9;    % m
g = 9.81;   % m s^-2

alfa1 = acos((b-L1)/L);   % Angulo alfa formado cuando el piston esta contraido
alfa2 = acos((b-L2)/L);   % Angulo alfa formado cuando el piston esta extendido  
nDivisiones = 100; % numero de divisiones del arreglo del angulo alfa
alfa = linspace(alfa1,alfa2,nDivisiones); % arreglo de angulos alfa va desde alfa1 hasta alfa 2. El tamano del arreglo es nDivisiones

N = M*g*a./(L*cos(alfa)); % Fuerza normal
Ey = M*g*a./(L*cos(alfa)); % Reaccion Ey
Dy = M*g*(1-a./(L*cos(alfa))); % Reaccion Dy

Fp = M*g*cot(alfa); % Fuerza piston
Cy = M*g*(1-2*a./(L*cos(alfa))); % Reaccion Cy
Cx =-Fp;  % Reaccion Cx
Fy = M*g*(1-a./(L*cos(alfa)));  % Reaccion Fy
Fx = -Fp;  % Reaccion Fx
magnitudReaccionB = sqrt(Fp.^2 + N.^2);

alfaGra = alfa*180/pi;  % angulo alfa en grados

colorAzul = [0 0 153]/255; % Codigo para el color azul oscuro
colorVino = [153 51 102]/255; % Codigo para el color vino

plot(alfaGra,Fp,'linewidth',1.2,'displayname','Fuerza F_{p}','color',colorAzul);
xlim([min(alfaGra) max(alfaGra)])  % Delimita el dominio de x
xlabel('Ángulo \alpha (°)')
ylabel('Fuerza (N)')
hold on
plot(alfaGra,N,'r','linewidth',1.2,'displayname','Fuerza N','color',colorVino);
legend('boxoff')
legend('location','best')
set(gca,'fontsize',13)

figure()

plot(alfaGra,Ey,'linewidth',1.2,'displayname','Fuerza E_{y}','color',colorAzul);
xlim([min(alfaGra) max(alfaGra)])
xlabel('Ángulo \alpha (°)')
ylabel('Fuerza (N)')
hold on
plot(alfaGra,Dy,'r','linewidth',1.2,'displayname','Fuerza D_{y}','color',colorVino)
legend('boxoff')
legend('location','best')
set(gca,'fontsize',13)


figure()

plot(alfaGra,Cx,'linewidth',1.2,'displayname','Fuerza C_{x}','color',colorAzul);
xlim([min(alfaGra) max(alfaGra)])
xlabel('Ángulo \alpha (°)')
ylabel('Fuerza (N)')
% subplot(1,2,2)
hold on
plot(alfaGra,Cy,'r','linewidth',1.2,'displayname','Fuerza C_{y}','color',colorVino)
legend('boxoff')
legend('location','best')
set(gca,'fontsize',13)

%% Calculo de fuerzas normales y perpendiculares

fuerzasC = [Cx;Cy];
fuerzasB = [Fp;N];
arregloConCeros = zeros(1,length(alfa)); 
fuerzasD = [arregloConCeros;Dy];
fuerzasCRot = zeros(2,length(alfa));
fuerzasBRot = zeros(2,length(alfa));
fuerzasDRot = zeros(2,length(alfa));

for i=1:length(alfa)
    matrizRotacion = [cos(alfa(i)) sin(alfa(i)); -sin(alfa(i)) cos(alfa(i))]; 
    fuerzasCRot(:,i) = matrizRotacion*fuerzasC(:,i);
    fuerzasBRot(:,i) = matrizRotacion*fuerzasB(:,i);
    fuerzasDRot(:,i) = matrizRotacion*fuerzasD(:,i);
end
    

figure()
plot(alfaGra,fuerzasCRot(1,:) ,'linewidth',1.2,'color',colorAzul,'displayname','Fuerza normal en C')
hold on
plot(alfaGra,fuerzasCRot(2,:) ,'linewidth',1.2,'color',colorVino,'displayname','Fuerza perpendicular en C')
xlabel('Ángulo \alpha (°)')
ylabel('Fuerza (N)')
xlim([min(alfaGra) max(alfaGra)])  
legend('boxoff')
legend('location','best')
set(gca,'fontsize',13)


figure()
plot(alfaGra,fuerzasBRot(1,:) ,'linewidth',1.2,'color',colorAzul,'displayname','Fuerza normal en B')
hold on
plot(alfaGra,fuerzasBRot(2,:) ,'linewidth',1.2,'color',colorVino,'displayname','Fuerza perpendicular en B')
xlabel('Ángulo \alpha (°)')
ylabel('Fuerza (N)')
xlim([min(alfaGra) max(alfaGra)])  
xlim([min(alfaGra) max(alfaGra)])  
legend('boxoff','location')
legend('location','best')
set(gca,'fontsize',13)

figure()
plot(alfaGra,fuerzasDRot(1,:) ,'linewidth',1.2,'color',colorAzul,'displayname','Fuerza normal en D')
hold on
plot(alfaGra,fuerzasDRot(2,:) ,'linewidth',1.2,'color',colorVino,'displayname','Fuerza perpendicular en D')
xlabel('Ángulo \alpha (°)')
ylabel('Fuerza (N)')
xlim([min(alfaGra) max(alfaGra)])  
xlim([min(alfaGra) max(alfaGra)])  
legend('boxoff')
legend('location','best')
set(gca,'fontsize',13)
