function tf = tabf_P_GiN(ir, nn)
    temp1 = (1 + ir)^nn;
    temp2 = temp1 - 1;
    temp3 = ir * temp1 * ir;
    temp4 = nn / (temp1 * ir);
    temp5 = temp2 / temp3;
    tf = temp5 - temp4;
end