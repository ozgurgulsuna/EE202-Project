clc
clear all
close all
%------------------------------------------------------------
% EE202 Project Part1
% By Ozgur Gulsuna
%Constants---------------------------------------------------
R=100;
L=1/2;
C1=10E-6;
C2=100E-6;

%Resolution in time and time span to be evaluated------------
resolution=1000000;
time_span=1;

%Coefficient Matrices----------------------------------------
A=[0,0,1/C1;0,-1/(R*C2),1/C2;-1/L,-1/L,0];
B=[0;0;1/L];

%Creating a linear time space--------------------------------
time=linspace(0,time_span,resolution);
increment=linspace(1,(resolution),(resolution));

%Empty state Matrix With time dimension----------------------
X=[0;0;0];
X=X*increment;

%Source Vector ----------------------------------------------
U=sin(150*pi*time);

%Main loop that evaluates the integral as a system ----------
for i=increment;
xx= A*X(:,i)+B*U(i);
if i>resolution-1
    break
end
X(:,i+1)=X(:,i)+xx*time_span/resolution;
end

%Plotting the Results----------------------------------------
figure();
subplot(3,1,1);
plot(time,X(1,:));
ylabel("Vc1 (V)");
xlabel("time (t)");
title("Vc1(t)");

subplot(3,1,2);
plot(time,X(2,:));
ylabel("Vc2 (V)");
xlabel("time (t)");
title("Vc2(t)");

subplot(3,1,3);
plot(time,X(3,:));
ylabel("iL1 (A)");
xlabel("time (t)");
title("iL1(t)");
