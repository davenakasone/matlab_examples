function rep_tech_1(def_yr1_mc, chg_euac_min)
    fprintf("\n\t...provided marginal costs of defender consistently increase, use technique 1\n");
    fprintf("\t\tdefender year1 mc  :  %10.0f\n", def_yr1_mc);
    fprintf("\t\tchallanger min euac:  %10.0f\n", chg_euac_min);
    if (chg_euac_min > def_yr1_mc)
        fprintf("\n\tchallager min EUAC > defender MC yr1,  so keep defender\n");
    else
        fprintf("\n\tchallager min EUAC < defender MC yr1,  so replace defender now\n");
    end
end