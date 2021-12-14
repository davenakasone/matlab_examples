function EUACs = rep_euac(otl, nn, marr, mkvz, omz)

    EUACs = zeros(1, nn);
    euac_cap = 0;
    euac_om = 0;
    min_euac = 9e19;
    
    fprintf("\n\t finding EUAC @ different lives\n");
    fprintf("\t\totl     :  %10.0f\n", otl);
    fprintf("\t\tmarr    :  %0.3f\n", marr*100);
    fprintf("\t\tmax life:  %3d\n", nn);
    
    fprintf("\nlife|     mkv      |      om      |   euac_cap   |    euac_om   |     euac \n");
    fprintf("-------------------------------------------------------------------------------\n");
    
    for ii = 1:1:nn
        euac_om = 0;
        euac_cap = A__P_i_N(otl, marr, ii) - A__F_i_N(mkvz(1,ii), marr, ii);
        if (ii == 1)
            euac_om = omz(1);
        else
            for jj = 1:1:ii
                euac_om = euac_om + P__F_i_N(omz(1,jj), marr, jj);
            end
            euac_om = A__P_i_N(euac_om, marr, ii);
        end
        EUACs(1,ii) = euac_cap + euac_om;
        fprintf("%2d  |  %10.0f  |  %10.0f  |  %10.0f  |  %10.0f  |  %10.0f\n",...
            ii, mkvz(ii), omz(ii), euac_cap, euac_om, EUACs(1,ii));
        if (EUACs(1,ii) < min_euac)
            min_euac = EUACs(1,ii);
        end
    end
    
    fprintf("\n\t\tmin EUAC:  %10.0f\n", min_euac);
   
end