%Programa que modula una senoidal y muestra la señal modulada en AM, la portadora y la moduladora en una misma ventana

fs = 400; %Frecuencia de muestreo
Ec = 5; %Voltaje pico de la portadora
fc = 20; %Frecuencia de la portadora
fm = 1; %Freceuncia de la moduladora
m = 0.8; %Indice de modulación

Nc = 5; %Número de ciclos que se mostrará en la gráfica
t = 0:1/fs:(Nc/fm); %Vector de tiempo

%Ciclo que se utiliza para marcar el límite del eje X de la gráfica
set(gcf, 'Position',  [50, 50, 1800, 900]) %Indica la posición y tamaña de la ventana. 
h = animatedline('Color', 'w');xlabel("Tiempo"); ylabel("Amplitud");grid on
t2 = 1:1:Nc
for k= 1:length(t2)    
    l = -2*Ec;
    addpoints(h,t2(k),l);    
    drawnow
end

%Utilizando la función drawnow se crea la gráfica durante la ejecución del programa. Se agrega un offset para poder visualizar las 3 gráficas en la misma ventana 
h1 = animatedline('Color', 'b');
h2 = animatedline('Color', 'r');
h3 = animatedline('Color', 'k');
legend('Portadora', 'Moduladora','Señal AM') %Leyendas de las gráficas
for k= 1:length(t)
    Vc = Ec*sin(2*pi*fc*t(k)); %Señal portadora
    Vmod = Ec*sin(2*pi*fm*t(k)); %Señal moduladora
    Vam = (1 + m*sin(2*pi*fm*t(k)))*Ec*sin(2*pi*fc*t(k)); %Señal modulada en AM
    addpoints(h1,t(k),(5*Ec)+Vc); %Gráfica de la señal portadora
    addpoints(h2,t(k),(3*Ec)+Vmod); %Gráfica de la señal moduladora
    addpoints(h3,t(k),Vam); %Gráfica de la señal modulada
    drawnow
end