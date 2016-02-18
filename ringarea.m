function Aring = ringarea(midr,dr)

topr = midr+dr./2;
bottomr = midr-dr./2;
Aring = (topr.^2-bottomr.^2)*pi;