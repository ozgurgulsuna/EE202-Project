clc
clear all
close all 

R=100;
L=0.5;
C1=10*10^-6;
C2=100*10^-6;

A=[0,0,1/C1;0,-1/(R*C2),1/C2;-1/L,-1/L,0];
B=[0;0;1/L];
sample_count=2000000;
time=linspace(0,5,sample_count);
X=[0.0;0.0;0.0];%Vc1;Vc2;iL
res=X*time;
i=1;
for t=time
res(:,i)=X;
i=i+1;
U=sin(150*pi*t);
dx=A*X+B*U;
X=X+dx*time(2);
end
figure();
subplot(3,1,1);
plot(time,res(1,:));
ylabel("Vc1");
xlabel("time");
title("Vc1(t)");

subplot(3,1,2);
plot(time,res(2,:));
ylabel("Vc2");
xlabel("time");
title("Vc2(t)");

subplot(3,1,3);
plot(time,res(3,:));
ylabel("iL1");
xlabel("time");
title("iL1(t)");
