function tf = tabf_A_FiN(ir, nn)
    temp = (1 + ir)^nn;
    temp1 = temp - 1;
    tf = ir / temp1;
end