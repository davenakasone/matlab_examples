%{
    periods required to double in value given interest rate
        approximate
%}
function outp = rule72_N(ir)

    fprintf("\nperiods N required to double investment, given interest rate\n");
    fprintf("\n\ti = %f\n", ir);
    
    npd = 72 / (100 * ir);
    
    fprintf("\nshould take:  %f  periods\n", npd);
    chk = (1+ir)^npd;
    fprintf("\tcheck  ,  Fv = (1 + i)^N = %f\n", chk);
    outp = npd;
end

%~~~~~~~~END>  rule72_N.m
