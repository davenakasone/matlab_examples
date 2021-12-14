%{
    Future value, given: 
        present value, interest rate, and number of periods
%}

%function outp = F__P_i_N (Pv, Ir, Npd)
function g_fv = F__P_i_N(g_pv, g_i, g_n)
global g_n;
global g_i; 
global g_pv;
global g_fv;

    g_fv = g_pv * (1 + g_i).^g_n;

end

%~~~~~~~~END>  F__P_i_N

%{

    % enforce compliance as needed
    
    Fv = Pv * ((1 + Ir)^Npd);
    
    global DEBUG;
    if (DEBUG == 1)
        fprintf("\ngiven:\n");
        fprintf("\tP =  %f\n", Pv);
        fprintf("\ti =  %f\n", Ir);
        fprintf("\tN =  %d\n", Npd);
        fprintf("\n\t\tFv =  %f\n", Fv);
    end
    
    %outp = Fv;



%}
