clear;clc;close all;
% this test file assumes:
% - proportionality between alpha and phi (slope difference)
% - constant lift distribution
% - constant blade pitch

%constants
dtr = pi/180; 

%inputs
n = 50;
T = 200;
density = 1.18;
omega = 700;
R = 0.381;
%phi(delta)
atop = 0.1;% alpha to phi slope ratio (realistically less than one)
bladepitch = 5*dtr; % root to chord

%derived inputs
dr = R/50;
r = linspace(dr/2,R-dr/2,n);
Aring = ringarea(r,dr);
A = pi*R^2;
V = omega*r;

%
P=0;
p = zeros(1,n);
Tring = zeros(1,n);
for k = 1:n
    Tring(k) = T*(Aring(k)/A);
    p(k) = getElementPower2(r(k),V(k),Tring(k),Aring(k),bladepitch,atop,density);
    P = P + p(k);
end

ideal = T*sqrt(T/2/density/A);
fom = ideal/P