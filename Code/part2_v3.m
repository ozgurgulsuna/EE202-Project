clc;
clear all;
close all;
%-----------------------
% EE202 Project Part2
% By Ozgur Gulsuna
%---------- ------------
%Constants-------------
L1=100E-3;
L2=500E-3;
L3=200E-3;
M=-200E-3;
C1=10E-6;
Va=10;
Vtest=1;
phi=0;
alpha=0.5;
R=100;

%Resloution------------
resolution=10000;

%Initilization of Coefficient Matrices-----------
A(3,3,resolution)=0;
B(3,1,resolution)=0;

%Creating a linear time space-----
omega=linspace(150*pi,300*pi,resolution);
Vs=Va*exp(j*phi);

% Filling up the Coefficient Matrices -----------
for n=1:1:resolution;
	A(:,:,n)=[((j*omega(n)*L1)+(1/(j*omega(n)*C1))+(j*omega(n)*L3)) , ((M*j*omega(n))+(1/(j*omega(n)*C1))+(j*omega(n)*L3)) , 0 ;((M*j*omega(n))+(1/(j*omega(n)*C1))+(j*omega(n)*L3)),((j*omega(n)*L2)+(1/(j*omega(n)*C1))+(j*omega(n)*L3)), -1 ; R*(alpha), -R, -1];
	B(:,:,n)=[Vs;0;0];
  D(:,:,n)=[0;0;Vtest];
  C(:,:,n)=[((j*omega(n)*L1)+(1/(j*omega(n)*C1))+(j*omega(n)*L3)) , ((M*j*omega(n))+(1/(j*omega(n)*C1))+(j*omega(n)*L3)) , 0 ;((M*j*omega(n))+(1/(j*omega(n)*C1))+(j*omega(n)*L3)),((j*omega(n)*L2)+(1/(j*omega(n)*C1))+(j*omega(n)*L3)), -1 ; 0, 0, 1];
end	

%Main for loop that the solution and outputs are generated------
for n=1:1:resolution;
	  X(:,:,n)=linsolve(A(:,:,n),B(:,:,n));
    Xz(:,:,n)=linsolve(C(:,:,n),D(:,:,n));
    Zo(n)=Vtest/(Xz(2,1,n));
    IL1(n)=(X(1,1,n));
    IL2(n)=(X(2,1,n));
    Vo(n)=(X(3,1,n));
    Zin(n)=Vs/IL1(n);
    Qs(n)=imag(Vs*conj(IL1(n)));
    P2(n)=real(Vo(n)*alpha*conj(IL1(n)))+real((Vs*conj(IL1(n))));
    Qd(n)=imag(Vo(n)*alpha*conj(IL1(n)));
end

%Plotting the results--------------------------

figure();
plot(omega,abs(IL2));
title("|IL2| vs Omega")
grid minor;
ylabel("|IL2| A(amperes)")
xlabel("omega (rad/sec)")

figure();
subplot(2,1,1)
[ax,ax1,ax2]= plotyy(omega,real(IL1),omega,imag(IL1));
set(ax1,'LineWidth',1);
set(ax2,'linestyle',"-");
set(ax2,'LineWidth',1);
ylabel(ax(1),"Re(IL1) A(amperes)")
ylabel(ax(2),"Im(IL1) iA(i amperes)")
xlabel("omega (rad/sec)")
grid minor;
title("Re(IL1), Im(IL1) vs Omega")
subplot(2,1,2)
plot(omega,abs(IL1))
ylabel("|IL1| A(amperes)")
xlabel("omega (rad/sec)")
grid minor;
title("|IL1| vs Omega")

figure();
plot(omega,abs(Vo));
title("|Vo| vs Omega")
grid minor;
ylabel("|Vo| V(volts)")
xlabel("omega (rad/sec)")

figure();
plot(omega,abs(Zin));
title("|Zin| vs Omega")
grid minor;
ylabel("|Zin| Ohm")
xlabel("omega (rad/sec)")

figure();
plot(omega,(P2));
title("Real Power vs Omega")
grid minor;
ylabel("Avg. Real Power W(watts) ")
xlabel("omega (rad/sec)")

figure();
plot(omega,((Qs+Qd)/2));
title("Reactive Power vs Omega")
grid minor;
ylabel("Avg. Reactive Power VAR(Volt ampere reactive) ")
xlabel("omega (rad/sec)")

figure();
plot(omega,abs(Zo));
title("Output Impedance vs Omega")
grid minor;
ylabel("Zo ohms  ")
xlabel("omega (rad/sec)")
ylim([0 2000])
xlim([150*pi 300*pi])










