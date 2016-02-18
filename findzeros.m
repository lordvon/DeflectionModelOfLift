function interped = findzeros(val,tointerp)

mask = diff(sign(val));
ii = find(mask~=0);

shortrange = ii(1):ii(1)+1;
shortval = val(shortrange);
shortinterp = tointerp(shortrange);
interped = interp1(shortval,shortinterp,0);