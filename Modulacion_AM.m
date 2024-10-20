%Programa que modula una senoidal y muestra la se�al modulada en AM, la portadora y la moduladora en una misma ventana

fs = 400; %Frecuencia de muestreo
Ec = 5; %Voltaje pico de la portadora
fc = 20; %Frecuencia de la portadora
fm = 1; %Freceuncia de la moduladora
m = 0.8; %Indice de modulaci�n

Nc = 5; %N�mero de ciclos que se mostrar� en la gr�fica
t = 0:1/fs:(Nc/fm); %Vector de tiempo

%Ciclo que se utiliza para marcar el l�mite del eje X de la gr�fica
set(gcf, 'Position',  [50, 50, 1800, 900]) %Indica la posici�n y tama�a de la ventana. 
h = animatedline('Color', 'w');xlabel("Tiempo"); ylabel("Amplitud");grid on
t2 = 1:1:Nc
for k= 1:length(t2)    
    l = -2*Ec;
    addpoints(h,t2(k),l);    
    drawnow
end

%Utilizando la funci�n drawnow se crea la gr�fica durante la ejecuci�n del programa. Se agrega un offset para poder visualizar las 3 gr�ficas en la misma ventana 
h1 = animatedline('Color', 'b');
h2 = animatedline('Color', 'r');
h3 = animatedline('Color', 'k');
legend('Portadora', 'Moduladora','Se�al AM') %Leyendas de las gr�ficas
for k= 1:length(t)
    Vc = Ec*sin(2*pi*fc*t(k)); %Se�al portadora
    Vmod = Ec*sin(2*pi*fm*t(k)); %Se�al moduladora
    Vam = (1 + m*sin(2*pi*fm*t(k)))*Ec*sin(2*pi*fc*t(k)); %Se�al modulada en AM
    addpoints(h1,t(k),(5*Ec)+Vc); %Gr�fica de la se�al portadora
    addpoints(h2,t(k),(3*Ec)+Vmod); %Gr�fica de la se�al moduladora
    addpoints(h3,t(k),Vam); %Gr�fica de la se�al modulada
    drawnow
end