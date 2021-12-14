function MCS = rep_marginal_costs(otl, nn, marr, mkvz, omz)
   
    lost_mkv = zeros(1,nn);
    lost_int = zeros(1,nn);
    marg_cost = zeros(1,nn);
    min_mc = 9e19;
    
    fprintf("\n\t finding marginal costs\n");
    fprintf("\t\totl     :  %10.0f\n", otl);
    fprintf("\t\tmarr    :  %0.3f\n", marr*100);
    fprintf("\t\tmax life:  %3d\n", nn);
    
    fprintf("\nYear |    mkv       |       om     |    loss val     |  loss int    |  mc\n");
    fprintf("-------------------------------------------------------------------------------\n");
    
    for ii = 1:1:nn
        if(ii == 1)
            lost_mkv(1,ii) = otl - mkvz(1,ii);
            lost_int(1,ii) = marr * otl;
        else
            lost_mkv(1,ii) = mkvz(1,ii-1) - mkvz(1,ii);
            lost_int(1,ii) = marr * mkvz(1,ii-1);
        end
        marg_cost(1,ii) = omz(1,ii) + lost_mkv(1,ii) + lost_int(1,ii);  
        fprintf(" %2d  |  %10.0f  |  %10.0f  |  %10.0f     |  %10.0f  |  %10.0f\n",...
            ii, mkvz(1,ii), omz(1,ii), lost_mkv(1,ii), lost_int(1,ii), marg_cost(1,ii));
        if (marg_cost(1,ii) < min_mc)
            min_mc = marg_cost(1,ii);
        end
    end
    fprintf("\n\t\tsmallest MC is %10.0f\n", min_mc);
    MCS = marg_cost;
end