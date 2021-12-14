%{
    Pv geometric   i != g
%}

function outp = P__A1_iNOTg_N (pmtA1, ri, rg, Npd)
    global DEBUG;
    if (DEBUG == 1)
        fprintf("\nPv of geometric gradient, i != g\n");
        fprintf("A1 = %f\n", pmtA1);
        fprintf("i = %f\n", ri);
        fprintf("g = %f\n", rg);
        fprintf("N = %d\n", Npd);
    end
    
    temp1 = ri - rg;
    if temp1 == 0
        fprintf("WRONG FORMULA, i == g\n");
        return;
    end
    
    temp2 = (1 + rg)^Npd;
    temp3 = (1 + ri)^(-Npd);
    temp4 = pmtA1 / temp1;
    temp5 = 1 - (temp2 * temp3);
    Pv = temp4 * temp5;
  
    if (DEBUG == 1)
        fprintf("\n\tPv = %12.2f\n", Pv);
    end
    
    outp = Pv;
end

%~~~~END>  P__A1_iNOTg_N.m
