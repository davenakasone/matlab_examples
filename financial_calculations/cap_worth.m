%{
    capitialized worth, given:
        current worth(investment), interest, annual yield amount
%}

function outp = cap_worth (outlay, ir, cash_flow)
    global DEBUG;
    if (DEBUG == 1)
        fprintf("capitalized worth, given:\n");
        fprintf("\toutlay:  %f\n", outlay);
        fprintf("\ti:  %f\n", ir);
        fprintf("\tcash flow / yield:  %f\n", cash_flow);
    end
    
    Cw = (cash_flow / ir) - outlay;
    
    if (DEBUG == 1)
        fprintf("\nCw =  %f\n", Cw);
    end
    
    outp = Cw;
end

%~~~~~~~END>  cap_worth.m
