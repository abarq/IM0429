function Resultado = calcularEnergiaVolanteInercia(T)
% Esta funcion determina la energia acumulada en un volante de inercia
% en el lapso en que el eje pasa de la velocidad angular minima a la
% velocidad angular maximo. Prof. Denis Abarca Quesada.

% ENTRADA: 
% 1. T: arreglo de la variacion del torque en funcion del angulo de
% manivela en rad.

% SALIDA:
% 1. energia: Escalar. Energia acumulada en el volante de inercia.

alfa = 0:0.1:359;
alfar = alfa*pi/180;
prom = mean(T);
TT = T-prom;
crucesZero = [];
n=1;
for i=1:length(TT)-1
   x1 = TT(i);
   x2 = TT(i+1);
   
   if (x1*x2 <= 0)
       crucesZero(n) = i;
       n = n+1;
   end
end

crucesZero = [1 crucesZero length(alfar)];
nPulsos = length(crucesZero)-1;
areas = nan(1,nPulsos);
acum = nan(1,nPulsos);
for i=1:nPulsos
    xIni = crucesZero(i);
    xFin = crucesZero(i+1);
    xDom = alfar(xIni:xFin);
    yAmb = TT(xIni:xFin);
    areas(i) = trapz(xDom,yAmb);
    
    sum = 0;
    for j=1:i
        sum = sum + areas(j);  
    end
    acum(i) = sum;
end
energiaEnOmegaMax = min(acum);
energiaEnOmegaMin = max(acum);
Resultado.energia = abs(energiaEnOmegaMax-energiaEnOmegaMin);
Resultado.energiaPulso = areas;
Resultado.energiaAcumuladaPulso = acum;
end