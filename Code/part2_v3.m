clc;
clear all;
close all;

resolution=10000;
L1=100E-3;
L2=500E-3;
L3=200E-3;
M=-200E-3;
C1=10E-6;
Va=10;
phi=0;
alpha=0.5;
R=100;
A(3,3,resolution)=0;
B(3,1,resolution)=0;
omega=linspace(150*pi,300*pi,resolution);
Vs=Va*e^(j*phi);
for n=1:1:resolution;
	A(:,:,n)=[((j*omega(n)*L1)+(1/(j*omega(n)*C1))+(j*omega(n)*L3)) , ((M*j*omega(n))+(1/(j*omega(n)*C1))+(j*omega(n)*L3)) , 0 ;((M*j*omega(n))+(1/(j*omega(n)*C1))+(j*omega(n)*L3)),((j*omega(n)*L2)+(1/(j*omega(n)*C1))+(j*omega(n)*L3)), -1 ; R*(alpha), -R, -1];
	B(:,:,n)=[Vs;0;0];
  end	

for n=1:1:resolution;
	X(:,:,n)=linsolve(A(:,:,n),B(:,:,n));
    IL1(n)=(X(1,1,n));
    IL2(n)=(X(2,1,n));
    Vo(n)=(X(3,1,n));
    Zin(n)=Vs/IL1(n);
    Zout(n)=Vo(n)/IL2(n);
    Ps(n)=real((Vs*conj(IL1(n))));
    Qs(n)=imag(Vs*conj(IL1(n)));
    Pr(n)=real((abs(Vo(n)))^2/(R));
    P2(n)=real(Vo(n)*alpha*conj(IL1(n)))+real((Vs*conj(IL1(n))));
    Qd(n)=imag(Vo(n)*alpha*conj(IL1(n)));

end

##figure()
%%plot(omega,imag(IL1));
##figure();
##plot(omega,abs(IL2));
##figure(); 
##plot(omega,abs(IL1));
##figure();
##plot(omega,Q);
##figure();
##xlabel("P");
##plot(omega,P1);
##figure();
plot(omega,(Qs+Qd)/2);
%%figure();
##hold on
%%plot(omega,P2/2);
##xlabel("P");








