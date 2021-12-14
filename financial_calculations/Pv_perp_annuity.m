%{
    the present value of an annuity, infinite periods

        ...the perpetual annuity or endowment
%}

function outp = Pv_perp_annuity(pmtA, ir)

    fprintf("\npresent value of annuity with infinte periods, given:\n");
    fprintf("\tpmtA =  %f\n", pmtA);
    fprintf("\ti =  %f\n", ir);
    
    Pv = pmtA / ir;
    
    fprintf("\nPv =  %f\n", Pv);
    outp = Pv;
end

%~~~~~~~~END>  Pv_perp_annuity.m
