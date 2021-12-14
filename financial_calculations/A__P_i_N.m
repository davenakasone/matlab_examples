%{
    pmtA, given:
        Pv, interest, periods
%}

function outp = A__P_i_N (Pv, ir, Npd)
    global DEBUG;
    if (DEBUG == 1)
        fprintf("\npmtA, given:\n");
        fprintf("\tPv:  %f\n", Pv);
        fprintf("\ti:  %f\n", ir);
        fprintf("\tN:  %d\n", Npd);
    end
    
    temp1 = (1 + ir)^Npd;
    temp2 = (ir * temp1) / ( temp1 - 1);
    pmtA = Pv * temp2;
    
    if (DEBUG == 1)
        fprintf("\npmtA =  %f\n", pmtA);
    end
    
    confirm = 0;
        for idx = 1:Npd
            temp = pmtA / ((1 + ir)^idx);
            confirm = confirm + temp;
        end
        
    if (DEBUG == 1)
        fprintf("confirmation to Pv:  %f\n", confirm);
    end
    
    outp = pmtA;
end

%~~~~~~~~END>  A__P_i_N
