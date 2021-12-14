function tf = tabf_F_GiN(ir, nn)
    temp1 = tabf_F_AiN(ir,nn);
    temp2 = tabf_A_GiN(ir,nn);
    tf = temp1*temp2;
end