function P = getElementPower(swirl,V,Tring,phi,delta)

fun = (swirl+(cos(phi)-1)*V)./sin(phi) - tan(delta)*V;

d = interp1(fun,delta,0);
if d == delta(1) || d == delta(end)
    disp('Warning! Determination of delta was clipped!');
end

p = interp1(delta,phi,d);
if p == 0
    Dring = 0;
else
    LD = sin(p)/(1-cos(p));
    Tring_ = Tring/(-sin(d)/LD + cos(d));
    Dring = Tring_*(cos(d)/LD + sin(d));
end

P = Dring*V;