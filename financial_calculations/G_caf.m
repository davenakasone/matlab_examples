%{
    gradient "G" of cash flow with constantly increasing pmt
        given interest rate and periods
...period starts increase @ N = 2
%}

function outp = G_caf(ir, Npd)
    fprintf("\ngradient G (const increase/decrease in cash flow)\n");
    fprintf("arithmetic gradient compound amount factor\n\n");
    fprintf("i = %f\n", ir);
    fprintf("N = %d\n", Npd);
    
    temp1 = (1+ir)^Npd;
    temp2 = (temp1 - 1) / (ir^2);
    temp3 = Npd/ir;
    fG = temp2 - temp3;
    fprintf("\n\tG = %f\n", fG);
    outp = fG;
end

%~~~~END> G_caf.m
