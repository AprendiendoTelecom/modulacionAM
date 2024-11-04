%Programa que modula una senoidal y muestra la señal modulada en AM, la portadora y la moduladora en una misma ventana

%Pide al usuario que ingrese los valores de amplitud y frecuencia de la portadora y de la moduladora.
%Así como el número de ciclos que se van a mostrar en la gráfica
M = input("Ingrese la amplitud de la moduladora: ");
fm = input("Ingrese la freceuncia de la moduladora: "); 
A = input("Ingrese la amplitud de la portadora: "); 
fc = input("Ingrese la frecuencia de la portadora: ");
Nc = input("Ingrese el número de ciclos que se mostrarán en la gráfica: ");

%El índice de modulación se calcula como el cociente entre la amplitud de la moduladora y la amplitud de la portadora 
m = M/A;

%Se calcula la frecuencia de muestreo como 15 veces el valor de la frecuencia de la señal portadora 
fs = 15*fc;

%Crea el eje del tiempo utilizando los valores ingresados
%El limite superior del eje horizontal se guarda en una variable para evitar errores
xlim_sup = Nc/fm;
t = 0:1/fs:xlim_sup;

%Gráfica continua con título, etiquetas de eje y límites de los ejes
set(gcf, 'Position',  [0, 200, 1600, 800])
xlabel("Tiempo"); ylabel("Amplitud");title("Modulación AM");ylim([-2*A 5*A+M]);grid on 

%Ciclo que se utiliza para graficar el límite del eje X
t2 = 0:1/fm:Nc/fm;
h = animatedline('Color', 'k');
for k = 1:length(t2)    
    l = -2*A;
    addpoints(h,t2(k),l);    
    drawnow
end

%Primero se determinan los colores y las leyendas de las 3 gráficas
h1 = animatedline('Color', 'b');
h2 = animatedline('Color', 'r');
h3 = animatedline('Color', 'k');
legend([h1,h2,h3],'Portadora', 'Moduladora','Señal AM')
%Con ayuda del a función drawnow y un ciclo se crean las 3 gráficas durante la ejecución del programa
for k= 1:length(t)
    Vc = A*sin(2*pi*fc*t(k)); %Señal portadora
    Vmod = M*sin(2*pi*fm*t(k)); %Señal moduladora
    Vam = (1 + Vmod/A)*Vc; %Señal modulada en AM
    
    %Se agrega un offset para poder visualizar las 3 gráficas en la misma ventana
    addpoints(h1,t(k), 4*A+M+Vc); %Gráfica de la señal portadora
    addpoints(h2,t(k), 2*A+M+Vmod); %Gráfica de la señal moduladora
    addpoints(h3,t(k),Vam); %Gráfica de la señal modulada
    drawnow
end

%Crea y muestra un texto que resume los datos de la gráfica
X = sprintf('\nMODULACION AM\nAmplitud de Moduladora: %d[V]\nFrecuencia de Moduladora: %d[Hz]\nAmplitud de portadora: %d[V]\nFrecuencia de portadora: %d[Hz]\nIndice de modulación: %.2f\nCiclos mostrados: %d\n',M,fm,A,fc,m,Nc);
disp(X)
