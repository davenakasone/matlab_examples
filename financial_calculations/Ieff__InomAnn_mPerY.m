%{
    calculate annaul effective rate "ie"
        given nominal annual "ir" and compounding periods per year "m"
%}

function ie = Ieff__InomAnn_mPerY(i_nominal_annual, m_per_year)
    fprintf("i effective, given:\n");
    fprintf("\tir = %f\n", i_nominal_annual);
    fprintf("\tm =  %d\n", m_per_year);
    
    temp1 = 1 + (i_nominal_annual / m_per_year);
    temp2 = temp1^m_per_year;
    ie = temp2 - 1;
    fprintf("effective rate:  %f\n", ie);
end