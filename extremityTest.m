function extreme = extremityTest(vec,val,tol)

range = abs(vec(end)-vec(1));
low = abs(vec(1)-val)/range;
high = abs(vec(end)-val)/range;

extreme = 0;
if low < tol || high < tol
    extreme = 1;
    disp(val)
end