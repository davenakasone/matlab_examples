%{
    Fv of geo grad, i == g
%}

function outp = F__A1_iISg_N (pmtA1, ir, Npd)
    global DEBUG;
    if (DEBUG == 1)
        fprintf("\nFv of geometric gradient, i == g\n");
        fprintf("A1 = %f\n", pmtA1);
        fprintf("i = g = %f\n", ir);
        fprintf("N = %d\n", Npd);
    end
    
    temp1 = pmtA1 * Npd;
    temp2 = (1 + ir)^(Npd-1);
    Fv = temp1 * temp2;
    
    if (DEBUG == 1)
        fprintf("\n\tFv = %12.2f\n", Fv);
    end
    
    outp = Fv;
end

%~~~~END>  F__A1_iISg_N.m
