function tf = tabf_P_AiN(ir, nn)
    temp1 = (1 + ir)^nn;
    temp2 = temp1 - 1;
    temp3 = temp1 * ir;
    tf = temp2 / temp3;
end