clc;
close all;
clear all;

%omega=220*pi;
L1=100E-3
L2=500E-3
L3=200E-3
M=-200E-3
C1=10E-6
Va=10;
phi=0;
alpha=0.5;
R=100;
A(2,2,1000)=0;
B(2,1,1000)=0;
omega=linspace(150*pi,300*pi,1000);
Vs=Va*e^(j*phi);
for n=1:1:1000
	A(:,:,n)=j*omega(n)*[(L1-C1+L3) (M-C1-L3);(M-C1+L3-(alpha*R)) (L2-C1+L3+R)];
	B(:,:,n)=[Vs;0];;
  end	

for n=1:1:1000
	X(:,:,n)=linsolve(A(:,:,n),B(:,:,n));
    IL1(n)= abs(X(1,1,n));
    IL2(n)= abs(X(2,1,n));
end


plot(omega,IL1)
hold on
plot(omega,IL2)
