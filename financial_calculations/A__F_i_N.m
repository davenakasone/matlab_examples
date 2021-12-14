%{
    pmt A, given:
        future value, interest rate, and periods
%}

function outp = A__F_i_N (Fv, ir, Npd)
    global DEBUG;
    if (DEBUG == 1)
        fprintf("\npmtA, given:\n");
        fprintf("\tFv =  %f\n", Fv);
        fprintf("\ti  =  %f\n", ir);
        fprintf("\tN  =  %d\n\n", Npd);
    end
    
    temp1 = (1 + ir)^Npd;
    temp2 = temp1 - 1;
    temp3 = ir / temp2;
    pmtA = Fv * temp3;
    
    if (DEBUG == 1)
        fprintf("pmtA =  %f\n", pmtA);
    end
    
    outp = pmtA;
end

%~~~~~~~~END>  A__F_i_N.m
