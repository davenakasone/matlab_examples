function dep_sl(basis, salvage, life)

    fprintf("\nbasis    :  %0.2f\n", basis);
    fprintf("salvage  :  %0.2f\n", salvage);
    fprintf("life     :  %0.2f\n", life);
    fprintf("\n            dk     |       BVk\n");
    fprintf("    ----------------------------------\n");
    
    dk = (basis - salvage) / life; % constant throught
    bvk = 0;
    for ii = 1:life
        bvk = basis - (ii * dk);
        fprintf("%2d)  %12.2f  |  %12.2f\n", ii, dk, bvk);
    end
    
end