function dep_switch_db_sl(basis, salvage, life, db_R)

    dk_sl = 0;
    dk_db = 0;
    dk = 0;
    BV = zeros(life);
    BV(1) = basis-salvage;
    
    fprintf("basis   :  %0.2f\n", basis);
    fprintf("salvage :  %02f\n", salvage);
    fprintf("life    :  %0.1f\n", life);
    fprintf("db  R   :  %0.2f\n", db_R);
    fprintf("\n           dk_sl   |    dk_db       |     choose     |     BVk\n");
    fprintf("        --------------------------------------------------------------------\n");
    
    for ii = 1:life
        dk_sl = (BV(ii)) / (life - ii + 1);
        dk_db = db_R * BV(ii);
        
        if (dk_db > dk_sl) 
            BV(ii+1) = BV(ii) - dk_db;
        else
            BV(ii+1) = BV(ii) - dk_sl;
        end
        fprintf(" %2d) %12.2f  |  %12.2f  |  %12.2f  |  %12.2f\n",...
            ii, dk_sl, dk_db, max([dk_db, dk_sl]), BV(ii+1));
    end
end