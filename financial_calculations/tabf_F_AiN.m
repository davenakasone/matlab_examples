function tf = tabf_F_AiN(ir, nn)
    temp = (1 + ir)^nn;
    tf = (temp - 1) / ir;
end