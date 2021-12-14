function tf = tabf_A_PiN(ir, nn)
    temp = (1 + ir)^nn;
    temp1 = ir * temp;
    temp2 = temp - 1;
    tf = temp1 / temp2;
end