clear all
close all
clc 
%--------------------------------------------------------------------------
%+Project Part1
%+By Furkan Gülcenbay
%+Special thanks to Siddharth Kaul for providing an example for state space 
%system solution and various other matlab commenters who shared examples on
%the functions used in the code below.
%--------------------------------------------------------------------------
%% State Space Representation
% x' = Ax + Bu
% y = Cx + Du
%% Given-------------------------------------------------------------------
R=100;
L=0.5;
C1=10*10^-6;
C2=100*10^-6;
timeT = linspace(0,1,2000);%source has high frequency interval 
%0-1s(not given in question) is good enough
U=sin(150*pi.*timeT);
%% State matrices, initial condition and unit matrix-----------------------
MatrixA=[0 0 1/C1; 0 -1/(R*C2) 1/C2; -1/L -1/L 0];
MatrixB=[0; 0; 1/L];
MatrixC = [1 1 1];
MatrixD = 0;
InitialX = [0;0;0];%NO initial condition is given
MatrixI = [1 0 0;0 1 0;0 0 1];
%% to convert dynamic system models to state-space model form
sys = ss(MatrixA,MatrixB,MatrixC,MatrixD);
% Create Symbolic Object s ------------------------------------------------
syms s;
% Assume ------------------------------------------------------------------
% MatrixSTM as state transition matrix order 3x3 with elements of inverse
% of resilient matrix ILT.
% -------------------------------------------------------------------------
ILT = (((s*MatrixI) - MatrixA)^-1);
MatrixSTM = [vpa(ilaplace(ILT(1,1))) vpa(ilaplace(ILT(1,2))) vpa(ilaplace(ILT(1,3)))
    vpa(ilaplace(ILT(2,1))) vpa(ilaplace(ILT(2,2))) vpa(ilaplace(ILT(2,3)))
    vpa(ilaplace(ILT(3,1))) vpa(ilaplace(ILT(3,2))) vpa(ilaplace(ILT(3,3)))];
%% Plotting Zero State Response Vc1(t) ------------------------------------
[y,t,x] = lsim(sys,U,timeT);
subplot(3,1,1);
plot(timeT,x(:,1));
xlim([0 0.6])%0.6 is good enough since  Vp-p does not change significantly after 0.6 
grid minor;
title('V_C_1(t) vs t Graph');
xlabel('Time(s)');
ylabel('Magnitude(V)');
%% Plotting Zero State Response Vc2(t) ------------------------------------
subplot(3,1,2);
plot(timeT,x(:,2));
xlim([0 0.6])
grid minor;
title('V_C_2(t) vs t Graph');
xlabel('Time(s)');
ylabel('Magnitude(V) ');
%% Plotting Zero State Response IL(t) -------------------------------------
subplot(3,1,3);
plot(timeT,x(:,3));
xlim([0 0.6])
grid minor;
title('I_L_1(t) vs t Graph');
xlabel('Time(s)');
ylabel('Magnitude(A)');
%% Results(display one by one because of Command window limits
%Display State Transition Matrix ------------------------------------------
disp('State Transition Matrix is = ');
disp(MatrixSTM);
