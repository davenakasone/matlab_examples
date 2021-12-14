%{
    Pv of geo gradient cashflows   i == g
%}

function outp = P__A1_iISg_N (pmtA1, ir, Npd)
    global DEBUG;
    if (DEBUG == 1)
        fprintf("\nPv of geometric gradient, i == g\n");
        fprintf("A1 = %f\n", pmtA1);
        fprintf("i = g = %f\n", ir);
        fprintf("N = %d\n", Npd);
    end
    
    temp1 = pmtA1 * Npd;
    temp2 = 1 + ir;
    Pv = temp1 / temp2;
    
    if (DEBUG == 1)
        fprintf("\n\tPv = %12.2f\n", Pv);
    end
    
    outp = Pv;
end

%~~~~END>  P__A1_iISg_N.m
