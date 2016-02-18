clear;clc;close all;

%constants
dtr = pi/180; 

%inputs
n = 50;
T = 200;
density = 1.18;
omega = 700;
R = 0.381;
%phi(delta)
atop = ;% alpha to phi mapping
delta = linspace(0,.9,10);
phi = 0.0174532925-delta;

%derived inputs
dr = R/50;
r = linspace(dr/2,R-dr/2,n);
Aring = ringarea(r,dr);
A = pi*R^2;
V = omega*r;
%pressure distribution, uniform
p = ones(1,n)*T/A;

%
swirl = p/2/density./V;
P=0;
p = zeros(1,n);
Tring = zeros(1,n);
for k = 1:n
    Tring(k) = T*(Aring(k)/A);
    %p(k) = getElementPower(swirl(k),V(k),Tring(k),phi,delta);
    p(k) = getElementPower2(r(k),V(k),Tring(k),Aring(k),density,phi,delta);
    P = P + p(k);
end

ideal = T*sqrt(T/2/density/A);
fom = ideal/P