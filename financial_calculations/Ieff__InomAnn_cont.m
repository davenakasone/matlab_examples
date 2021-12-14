%{
    calculate annaul effective rate "ie"
        given nominal annual "ir" 
        continuos componding, m = oo
%}

function ie = Ieff__InomAnn_cont(i_nominal_annual)
    fprintf("i effective, given:\n");
    fprintf("\tir = %f\n", i_nominal_annual);
    fprintf("\tm =  oo\n");
    
    temp1 = exp(i_nominal_annual);
    ie = temp1 - 1;
    fprintf("effective rate:  %f\n", ie);
end