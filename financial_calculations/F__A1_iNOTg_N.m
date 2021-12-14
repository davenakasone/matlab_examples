%{
    Fv, geo grad CF, i ~= g
%}

function outp = F__A1_iNOTg_N (pmtA1, ri, rg, Npd)
    global DEBUG;
    if (DEBUG == 1)
        fprintf("\nFv of geometric gradient, i != g\n");
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
    temp2 = (1 + ri)^Npd;
    temp3 = (1 + rg)^Npd;
    temp4 = pmtA1 / temp1;
    Fv = temp4 * (temp2 - temp3);
   
    if (DEBUG == 1)
        fprintf("\n\tFv = %12.2f\n", Fv);
    end
    
    outp = Fv;
end

%~~~~END> F__A1_iNOTg_N.m
