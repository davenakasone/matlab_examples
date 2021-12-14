function euac = rep_mc_2_euac(nn, marr, mcz)
    fprintf("\n\tgiven marginal cost, get EUAC:\n");
    fprintf("\t\tmarr:  %0.3f\n", 100*marr);
    fprintf("\t\tn   :  %3d\n", nn);
    fprintf("\nyear|     mc       |  euac\n");
    fprintf("----------------------------------\n");
    euac = zeros(1,nn);
    
    euac(1,1) = mcz(1);
    fprintf("%2d  |  %10.0f  | %10.0f\n", 1, mcz(1,1), euac(1,1));
    temp = 0;
    for ii = 2:1:nn
        temp = 0;
        for jj = 1:1:ii
            temp = temp + P__F_i_N(mcz(1,jj), marr, jj);
        end
        euac(1,ii) = A__P_i_N(temp, marr, ii);
        fprintf("%2d  |  %10.0f  | %10.0f\n", ii, mcz(1,ii), euac(1,ii));
    end
    
    min_mc = min(mcz, [], 'all');
    min_euac = min(euac, [], 'all');
    fprintf("\n\tmin MC    :  %10.0f\n", min_mc);
    fprintf("\tmin_euac  : %10.0f\n", min_euac);
end