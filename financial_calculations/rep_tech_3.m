function rep_tech_3(def_aw, chg_euac_min)
    fprintf("\n\t...not enougn for marginal costs of defender, use technique 3\n");
    fprintf("\t\tdefender aw        :  %10.0f\n", def_aw);
    fprintf("\t\tchallanger min euac:  %10.0f\n", chg_euac_min);
    if (chg_euac_min > def_aw)
        fprintf("\n\tchallager min EUAC > defender min AW / EUAC,  so keep defender\n");
    else
        fprintf("\n\tchallager min EUAC < defender min AW / EUAC,  so replace defender now\n");
    end
end