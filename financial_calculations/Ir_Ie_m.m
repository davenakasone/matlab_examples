function ir = Ir_Ie_m(ie, m)
    temp = (1 + ie)^(1/m);
    ir = m * (temp - 1);
end