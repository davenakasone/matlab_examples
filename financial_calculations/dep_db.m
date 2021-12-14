function dep_db (basis, life, db_R)

    fprintf("\nbasis    :  %0.2f\n", basis);
    fprintf("db_R     :  %0.2f\n", db_R);
    fprintf("life     :  %0.2f\n", life);
    fprintf("\n            dk     |       BVk\n");
    fprintf("    ----------------------------------\n");
    
    dk = 0;
    bvk = 0;
    for ii = 1:life
        dk = basis * db_R * (1 - db_R).^(ii - 1);
        bvk = basis * (1 - db_R).^ii;
        fprintf("%2d)  %12.2f  |  %12.2f\n", ii, dk, bvk);
    end
end