%{
    future value, given:
        pmt (A), interest rate, and periods (N)
%}

function outp = F__A_i_N (pmtA, ir, Npd)

    % validate parameters as needed
    global DEBUG;
    if (DEBUG == 1)
        fprintf("\nfuture value, given:\n");
        fprintf("\tpmt A =  %f\n", pmtA);
        fprintf("\ti =  %f\n", ir);
        fprintf("\tN =  %d\n\n", Npd);
    end
    
    %this is bull-shit...annuity due
    Fv_sub = zeros(1,Npd);
    Fv = 0;
    for idx = 0:Npd-1
        Fv_sub(1,idx+1) = pmtA * ((1 + ir)^idx);
        Fv = Fv + Fv_sub(1,idx+1);
        
        if (DEBUG == 1)
            fprintf("N = %d  ,  Fv =  %f\n", idx, Fv_sub(1,idx+1));
        end
    end
    
    temp1 = (1 + ir)^Npd;
    temp2 = (temp1 - 1) / ir;
    Fv_check = pmtA * temp2;
    
    if (DEBUG == 1)
        fprintf("\ntotal future value of pmts:  %f\n", Fv);
        fprintf("\nconfirmation:  %f\n", Fv_check);
    end
    
    outp = Fv;
end

%~~~~~~~~END>  F__A_i_N
