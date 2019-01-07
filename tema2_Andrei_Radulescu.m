%Semnal dreptunghiular
%Perioada T = 40 s
%Durata semnalelor D = 77.5
%Numar de coeficienti = 50

T=40; %Perioada semnalului 
f=1/T; %Frecventa semnalului
t=-3*T:1:3*T; %Rezolutia temporala
D=52.5;  %Durata pulsului
N=50;   %Numarul de coeficienti
xIn=square(2*pi*f*t,D); %Semnalul initial
f0=@(t)square(2*pi*f*t,D);
CC=1/T*integral(f0,0,T);
Ck=zeros(1,N);Ak=zeros(1,N);
xRef=0; %Initializam cu 0 semnalul refacut
for (i=1:1:N)
   fun=@(t)square(2*pi*f*t,D).*exp(-2*pi*f*t*1j*(i-25));
   Ck(i)=1/T*integral(fun,0,T);
   Ak(i+1)=2*abs(Ck(i));
   xRef=xRef+Ck(i)*exp(2*pi*f*t*1j*(i-25));
end
figure(1);
plot(t,xRef,t,xIn,'r'); %Schitarea semnalului modificat
figure(2)
Ak(26)=abs(CC); Ak(1)=Ak(51);
stem([0:N],Ak,'g'); %Expunerea spectrului de valori


%Conform teoriei seriilor Fourier, orice semnal periodic poate fi aproximat
%printr-o suma infinita de cosinusuri si sinusuri de diferite frecvente (aceste
%frecvete se numesc armonice de frecventa) fiecare avand cate un coeficient.
%Semnalul nostru reconstruit prezinta un numar finit de termeni(N=50) si
%din acest motiv prezinta si o marja de eroare. Cu cat crestem numarul 
%de termeni cu atat se va diminiua marja de eroare.