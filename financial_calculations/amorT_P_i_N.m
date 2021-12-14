%{
    building an amortization table, given:
        Pv, i, N
%}

function amorT_P_i_N (Pv, ir, Npd)
    global DEBUG;
    if (DEBUG == 1)
        fprintf("\namoritzation table, given:\n");
        fprintf("\tPv:  %f\n", Pv);
        fprintf("\ti:  %f\n", ir);
        fprintf("\tN:  %d\n", Npd);
    end
    
    temp1 = (1 + ir)^Npd;
    temp2 = (ir * temp1) / (temp1 - 1);
    pmtA = Pv * temp2;
    temp = 0;
    for idx = 1:Npd
        temp = temp + pmtA * ( 1 / (1 + ir)^idx);
    end
    
    if (DEBUG == 1)
        fprintf("\tpmtA:  %f       ...confirm to Pv:  %f\n", pmtA, temp);
    end
    
    fprintf("\npmt #     interest     principal     pmt_check    remaining\n");
    
    pd = zeros(1, Npd);
    prin = zeros(1, Npd);
    intp = zeros(1, Npd);
    bal = zeros(1, Npd);
    
    for ct = 1:Npd
        pd(1, ct) = ct;
        pdr = Npd - ct;
        tmp = (1 + ir)^pdr;
        bal(1, ct) = pmtA * (tmp - 1) / (ir * tmp);
        
        if ct == 1
            intp(1, ct) = Pv * ir;
        else
            intp(1, ct) = bal(1, ct-1) * ir;
        end
            
        prin(1, ct) = pmtA - intp(1, ct);
        pmt_chk = prin(1, ct) + intp(1, ct);
        fprintf("%3d %12.2f %12.2f  %12.2f  %12.2f\n",...
            pd(1, ct), intp(1, ct), prin(1, ct), pmt_chk, bal(1, ct));
    end
    
    tot_i = sum(intp(:));
    tot_p = sum(prin(:));
    tot_pmt = tot_i + tot_p;
    tot_pmt_chk = pmtA * Npd;
    fprintf("\ntotal interest              total prin              total pmt\n");
    fprintf("  %12.2f         %12.2f            %12.2f ==  %12.2f\n",... 
        tot_i, tot_p, tot_pmt, tot_pmt_chk);
end

%~~~~~~~~END>  amorT_P_i_N (Pv, ir, Npd).m
