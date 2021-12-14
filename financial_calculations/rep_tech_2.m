function rep_tech_2(def_euac_min, chg_euac_min)
    fprintf("\n\t...provided marginal costs of defender increase and decrease, use technique 2\n");
    fprintf("\t\tdefender min euac  :  %10.0f\n", def_euac_min);
    fprintf("\t\tchallanger min euac:  %10.0f\n", chg_euac_min);
    if (chg_euac_min > def_euac_min)
        fprintf("\n\tchallager min EUAC > defender min EUAC,  so keep defender\n");
    else
        fprintf("\n\tchallager min EUAC < defender min EUAC,  so replace defender now\n");
    end
end