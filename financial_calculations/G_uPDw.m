%{
    "Arithmetic gradient uniform worth factor"
        given interest and periods
%}

function outp = G_uPDw(ir, Npd)
    fprintf("\nArithmetic gradient uniform worth factor\n");
    fprintf("i = %f\n", ir);
    fprintf("N = %d\n", Npd);
    
    temp = (1 + ir)^Npd;
    temA = 1 / ir;
    temB = Npd / (temp - 1);
    Gf = temA - temB;
    fprintf("\n\tG = %f\n", Gf);
    outp = Gf;
end

%~~~~END>  G_uPDw.m

      