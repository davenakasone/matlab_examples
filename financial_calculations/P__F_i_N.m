%{
    Present value, given: 
        future value, interest rate, and number of periods
%}

function outp = P__F_i_N (Fv, Ir, Npd)

    % enforce compliance as needed
    
    Pv = Fv / ((1 + Ir)^Npd);
    
    global DEBUG;
    if (DEBUG == 1)
        fprintf("\ngiven:\n");
        fprintf("\tF =  %f\n", Fv);
        fprintf("\ti =  %f\n", Ir);
        fprintf("\tN =  %d\n", Npd);
        fprintf("\n\t\tPv =  %f\n", Pv);
    end
    
    outp = Pv;
end

%~~~~~~~~END>  P__F_i_N
