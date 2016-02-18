function phi = gammatophi_simple(inflowangle,pitchangle,atop)
% inflow angle to resulting phi angle
% simple version, assumes proportionality between alpha and phi

alpha = pitchangle-inflowangle;
phi = alpha*atop;