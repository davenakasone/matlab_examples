%{
    present value of annuity, given:
        pmtA, interest, and periods
%}

function outp = P__A_i_N (pmtA, ir, Npd)
    global DEBUG;
    if (DEBUG == 1)
        fprintf("present value of annuity, given:\n");
        fprintf("\tpmtA =  %f\n", pmtA);
        fprintf("\ti =  %f\n", ir);
        fprintf("\tN =  %d\n\n", Npd);
    end
    
    Pv_sub = zeros(1, Npd);
    Pv = 0;
    
    for idx = 1:Npd
        Pv_sub(1, idx) = pmtA / ((1 + ir)^idx);
      
        if (DEBUG == 1)
            fprintf("N =  %d  ,  Pv =  %f\n", idx, Pv_sub(1, idx));
        end
        Pv = Pv + Pv_sub(1, idx);
    end
    
    
    temp1 = (1 + ir)^Npd;
    temp2 = (temp1 - 1) / (ir * temp1);
    Pv_check = pmtA * temp2;
   
    if (DEBUG == 1)
        fprintf("\nPV of annuity:  %f\n", Pv);
        fprintf("confirmation:  %f\n", Pv_check);
    end
    
    outp = Pv;
end

%~~~~~~~~END>  P__A_i_N.m
