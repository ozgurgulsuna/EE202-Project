clear all
close all
clc 
%% State Space Representation
% x' = Ax + Bu
% y = Cx + Du

%% Given (define R,L,C1,C2 )
R=;
L=;
C1=;
C2=;

%% Create a state matrices A and B
A=;
B=;

%% Create a time axis from 0 to stop time
time=;

%% Create state and input matrices (for given time spaces) 
X=; % X includes three states for each time, you can initialize by giving 0
U=; % the input is given in the project
%% Loop for each time step to find states for each time numerically
for  % loop for time domain
%     x' = Ax + Bu 
%     X(i+1)=X(i)+time_step*x' 
%    
end

%% Plot the each states 
figure();
subplot(3,1,1);
plot()
ylabel()
xlabel()
title()

subplot(3,1,2);
plot()
ylabel()
xlabel()
title()

subplot(3,1,3);
plot()
ylabel()
xlabel()
title()





