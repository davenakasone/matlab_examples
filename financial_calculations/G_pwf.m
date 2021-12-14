%{
    "arithmetic gradient present worth factor"
        given interest rate and number of periods
%}

function outp = G_pwf(ir, Npd)
    fprintf("\narithmetic gradient present worth factor\n");
    fprintf("i = %f\n", ir);
    fprintf("N = %d\n", Npd);
    
    temp = (1 + ir)^Npd;
    temA = temp - 1;
    temB = (ir^2) * temp;
    temC = temA / temB;
    temD = Npd / (ir * temp);
    aGpwf = temC - temD;
    fprintf("\n\tG = %f\n", aGpwf);
    outp = aGpwf;
end

%~~~~END>  G_pwf.m
