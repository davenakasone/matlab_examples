function tf = tabf_A_GiN(ir, nn)
    temp = (1 + ir)^nn;
    temp1 = 1/ ir;
    temp2 = temp - 1;
    temp3 = nn / temp2;
    tf = temp1 - temp3;
end