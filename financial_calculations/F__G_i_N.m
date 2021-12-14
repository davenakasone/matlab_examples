%{
    Future value of gradient cashflows, given
        G (arithmatic gradient, continous uniform change in value)
        interest rate 
        number of periods
%}

function outp = F__G_i_N(fG, ir, Npd)
    global DEBUG;
    if (DEBUG == 1)
        fprintf("\nFuture value of gradient cashflows, uniform change in value\n");
        fprintf("G = %f\n", fG);
        fprintf("i = %f\n", ir);
        fprintf("N = %d\n", Npd);
    end
    
    temp1 = (1 + ir)^Npd;
    temp2 = (temp1 - 1) / ir;
    temp3 = temp2 - Npd;
    Fv = (fG / ir) * temp3;
    
    if (DEBUG == 1)
        fprintf("\n\tFv =  %12.2f\n", Fv);
    end
    
    outp = Fv;
end
%~~~~END>  F__G_i_N.m
