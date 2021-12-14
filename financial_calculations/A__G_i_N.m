%{
    get pmt from uniform/arith gradient cashflows
%}

function outp = A__G_i_N(Gf, ir, Npd)
    global DEBUG;
    if (DEBUG == 1)
        fprintf("\ncalculate pmt for uniform arith grad cf\n");
        fprintf("G = %f\n", Gf);
        fprintf("i = %f\n", ir);
        fprintf("N = %d\n", Npd);
    end
        temp = (1 + ir)^Npd;
        temp1 = 1 / ir;
        temp2 = Npd / (temp - 1);
        pmt = Gf * (temp1 - temp2);
        
   if (DEBUG == 1)
        fprintf("\n\tpmt = %12.2f\n", pmt);
   end
        outp = pmt;
end

%~~~~END>  A__G_i_N.m
