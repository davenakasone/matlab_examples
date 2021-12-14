function Np = payback_dis(net_cf, outlay, ir)

    temp1 = log(net_cf) - log(net_cf - outlay * ir);
    temp2 = log(1 + ir);
    Np = temp1 / temp2;
end