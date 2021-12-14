%{
    calculate Pv from aG_pwf
%}

function f_ret = P__G_i_N(Gf, ir, Npd)
    global DEBUG;
    if (DEBUG == 1)
        fprintf("\nPv from aGpwff, i, N\n");
        fprintf("G = %f\n", Gf);
        fprintf("i = %f\n", ir);
        fprintf("N = %d\n", Npd);
    end
    
    temp = (1 + ir)^Npd;
    temA = temp - 1;
    temB = (ir^2) * temp;
    temC = temA / temB;
    temD = Npd / (ir * temp);
    Gff = temC - temD;
    ttt = Gf*Gff;
    f_ret = ttt;
    %out_p = (aGpwf .* Gf);
    %fprintf("\n\tPv = %12.2f\n", out_p);
end

%~~~~END>  P__G_i_N.m