clc
clear all
close all

R=100;
L=0.5;
C1=10*10^-6;
C2=100*10^-6;

resolution=200000;
time_span=5;

A=[0,0,1/C1;0,-1/(R*C2),1/C2;-1/L,-1/L,0];
B=[0;0;1/L];

time=linspace(0,time_span,resolution);
increment=linspace(1,(resolution),(resolution));

X=[0;0;0];
X=X*increment;
U=sin(150*pi*time);

for i=increment;
xx= A*X(:,i)+B*U(i);
if i>resolution-1
    break
end
X(:,i+1)=X(:,i)+xx*time_span/resolution;
end
figure();
subplot(3,1,1);
plot(time,X(1,:));
ylabel("Vc1");
xlabel("time");
title("Vc1(t)");

subplot(3,1,2);
plot(time,X(2,:));
ylabel("Vc2");
xlabel("time");
title("Vc2(t)");

subplot(3,1,3);
plot(time,X(3,:));
ylabel("iL1");
xlabel("time");
title("iL1(t)");
