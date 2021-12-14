%{
    1  :  marginal cost
    2  :  euac -> determine service life
    3  :  marginal cost from EUAC
    4  :  technique 1, defender's MC always increase
    5  :  technique 2, MC does not always increase
    6  :  technique 3, not enough info
    7  :  hw 1
    8  :  hw 2
    9  :  hw 4
    10 :  quiz 1
    11 :  quiz 3
    12 :  quiz 8
    13 :  quiz 12

%}
clc;
close;
clearvars;
selector = 12;    % change here

global DEBUG; DEBUG = -1;
hp_2_kw = 0.746;

% GDS MACRS, half year element if you sell early
gds_3 = [0.3333, 0.4445, 0.1481, 0.0741];
gds_5 = [0.2000, 0.3200, 0.1920, 0.1152, 0.1152, 0.0576];
gds_7 = [0.1429, 0.2449, 0.1749, 0.1249, 0.0893, 0.0892, 0.0893, 0.0446];
gds_10 = [0.1000, 0.1800, 0.1440, 0.1152, 0.0922, 0.0737, 0.0655, 0.0655, 0.0656, 0.0655, 0.0328];


global g_n; syms g_n; %  periods "N"
global g_m; syms g_m; % sub period
global g_i; syms g_i; % instrest rate "i"
global g_ief; syms g_ief; % effective rate;
global g_iir; syms g_irr; assume(g_irr, 'real'); % internal rate of return
global g_pv; syms g_pv; % presnt value
global g_fv; syms g_fv; % future value
global g_pmt; syms g_pmt; % payment or periodic cash flow
global g_G; syms g_G; % arithmetic gradient per period
global g_g; syms g_g; % geometric gradient 
global g_A1; syms g_A1; % base pmt for geometric gradient
global ti_f; syms ti_f; % federal income tax rate
global ti_s; syms ti_s; % state income tax rate
global tax; syms tax; % any tax rate of interest
global Bmarr; syms Bmarr;  % before-tax MARR
global Amarr; syms Amarr;  % after tax MARR


F_PiN(g_pv, g_i, g_n) = g_pv * (1 + g_i).^g_n;
P_FiN(g_fv, g_i, g_n) = g_fv / (1 + g_i).^g_n;
perp(g_pmt, g_i) = g_pmt / g_i;
ieff_m(g_i, g_m) = ((1 + g_i/g_m)^g_m) - 1;
ieff_c(g_i) = exp(g_i) - 1;

A_FiN(g_fv, g_i, g_n) = g_fv * g_i / ( ((1 + g_i).^g_n) - 1);
A_PiN(g_pv, g_i, g_n) = g_pv * g_i * ((1 + g_i).^g_n) / (((1 + g_i).^g_n) - 1);
F_AiN(g_pmt, g_i, g_n) = (g_pmt / g_i) * (((1 + g_i).^g_n) - 1);
P_AiN(g_pmt, g_i, g_n) = g_pmt * (((1 + g_i).^g_n) - 1) / (g_i * ((1 + g_i).^g_n));

P_GiN(g_G, g_i, g_n) = g_G * ( ( (((1 + g_i).^g_n) - 1) / ((g_i^2) * ((1 + g_i).^g_n)) ) - ( g_n / (g_i * (1 + g_i).^g_n  ) ) ); 
F_GiN(g_G, g_i, g_n) = g_G * ( ( (((1 + g_i).^g_n) - 1) / (g_i^2) ) - ( g_n / g_i) );
A_GiN(g_G, g_i, g_n) = g_G * ( (1/g_i) - (g_n / (((1 + g_i).^g_n) - 1)) );

P_A1igN(g_A1, g_i, g_g, g_n) = (g_A1/(g_i - g_g)) * (1 - (((1 + g_g).^(g_n)) / (1 + g_i).^(1*g_n)) );
P_A1iiN(g_A1, g_i, g_n) = (g_A1 * g_n) / (1 + g_i);
F_A1igN(g_A1, g_i, g_g, g_n) = (g_A1/(g_i - g_g)) * ( ((1 + g_i).^g_n) - ((1 + g_g).^g_n) );
F_A1iiN(g_A1, g_i, g_n) = g_A1 * g_n * (1 + g_i).^(g_n - 1);



%--------------------------------------------------------------------------------------------
if selector == 1
    otl = 50e3;
    nn = 6;
    marr = .2;
    mkvz = [39e3, 30e3, 22e3, 15e3, 10e3, 6e3];
    omz = [5e3, 7500, 9500, 13e3, 20e3, 25e3];
    
    marg = rep_marginal_costs(otl, nn, marr, mkvz, omz);
    fprintf("%10.0f\n", marg);
end


%--------------------------------------------------------------------------------------------
if selector == 2
    otl = 50e3;
    marr = .2;
    nn = 6;
    mkvz = [39e3, 30e3, 22e3, 15e3, 10e3, 6e3];
    omz = [5e3, 7500, 9500, 13e3, 20e3, 25e3];
    
    yucs = rep_euac(otl, nn, marr, mkvz, omz);
    fprintf("%10.0f\n", yucs);
end


%--------------------------------------------------------------------------------------------
if selector == 3
    nn = 6;
    marr = .2;
    mcz = [26e3, 24300, 23500, 24400, 28e3, 31e3];
    
    rep_mc_2_euac(nn, marr, mcz);
end


%--------------------------------------------------------------------------------------------
if selector == 4
    
    marr = .1;
    
    def_nn = 4;
    def_otl = 7500;
    def_mvz = [6000, 4500, 3000, 1500];
    def_omz = [8250, 9900, 11700, 13200];
    
    chg_nn  = 5;
    chg_otl = 30e3;
    chg_mvz = [22500, 16875, 12750, 9750, 7125];
    chg_omz = [3000, 4500, 7000, 10e3, 13e3];
    
    % step1)  determine challanger's EUAC
    chg_euac = rep_euac(chg_otl, chg_nn, marr, chg_mvz, chg_omz);
    chg_euac_min = min(chg_euac, [], 'all');
    fprintf("\n\tmin euac of challanger:  %10.0f\n", chg_euac_min);
    
    %step2)  determine defender's MC
    def_mc = rep_marginal_costs(def_otl, def_nn, marr, def_mvz, def_omz);
    fprintf("\n\tnotice the marginal costs consistently increase\n");
    
    %step3)  choose tech1
    rep_tech_1(def_mc(1,1), chg_euac_min);
end


%--------------------------------------------------------------------------------------------
if selector == 5
    
    marr = .1;
    
    def_nn = 4;
    def_otl = 34e3;
    def_mvz = [23e3, 20e3, 16e3, 11e3];
    def_omz = [18500, 21e3, 23500, 26e3];
    
    chg_nn  = 4;
    chg_otl = 50e3;
    chg_mvz = [40e3, 32e3, 24e3, 16e3];
    chg_omz = [13e3, 15500, 18e3, 20500];
    
    %step1) determine min EUAC of challager
    chg_euac = rep_euac(chg_otl, chg_nn, marr, chg_mvz, chg_omz);
    chg_euac_min = min(chg_euac, [], 'all');
    fprintf("\n\tmin euac of challanger:  %10.0f\n", chg_euac_min);
    
    %step2)  determine defender's MC
    def_mc = rep_marginal_costs(def_otl, def_nn, marr, def_mvz, def_omz);
    fprintf("\n\tnotice the marginal do not always increase\n");
    
    %step3)  have to make EUAC's from defender's MC
    def_2_euac = rep_mc_2_euac(def_nn, marr, def_mc);
    def_2_euac_min = min(def_2_euac, [], 'all');
    fprintf("dender, MC-EUAC min:  %10.0f\n", def_2_euac_min);
    
    rep_tech_2(def_2_euac_min, chg_euac_min);
end


%--------------------------------------------------------------------------------------------
if selector == 6
    
    marr = .1;
    
    def_nn = 4;
    def_otl = 34e3;
    def_mvz = [0, 0, 0, 11e3]; % not enough info
    def_omz = [18500, 21e3, 23500, 26e3];
    
    chg_nn  = 6;
    chg_otl = 54e3;
    chg_mvz = [40e3, 30e3, 18e3, 8e3, 4e3, 1e3];
    chg_omz = [13e3, 15500, 18e3, 20500, 26e3, 30e3];
    
    %step1) determine min EUAC of challager
    chg_euac = rep_euac(chg_otl, chg_nn, marr, chg_mvz, chg_omz);
    chg_euac_min = min(chg_euac, [], 'all');
    fprintf("\n\tmin euac of challanger:  %10.0f\n", chg_euac_min);
    
    %step2)  can't get  defender's MC, so make AW
    temp = P_FiN(def_omz(1), marr, 1) + P_FiN(def_omz(2), marr, 2) +...
        P_FiN(def_omz(3), marr, 3) + P_FiN(def_omz(4), marr, 4);
    def_aw = A_PiN(def_otl, marr, 4) - A_FiN(def_mvz(4), marr, 4) + A_PiN(temp, marr, 4);
    fprintf("defender AW:  %10.0f   basically a EUAC\n", def_aw);
    
    rep_tech_3(def_aw, chg_euac_min);
end


%--------------------------------------------------------------------------------------------
if selector == 7
    marr = .14;
    nn = 5;
    otl = 8e3;
    omz = [3e3, 3e3, 3500, 4e3, 4500];
    mvz = [7e3, 6e3, 5e3, 3500, 2250];
    euac = rep_euac(otl, nn, marr, mvz, omz);
    
end


%--------------------------------------------------------------------------------------------
if selector == 8
    marr = .17;
    
    def_nn = 3;
    def_otl = 84e3;
    def_mv = [72e3, 58e3, 41e3];
    def_om = [15600, 16300, 17e3];
    
    chg_nn = 5;
    chg_euac_min = 45545;
    
    def_mc = rep_marginal_costs(def_otl, def_nn, marr, def_mv, def_om);
end


%--------------------------------------------------------------------------------------------
if selector == 9
    nn = 4;
    marr = .16;
    
    otl = 10e3;
    mvz = [6e3, 5e3, 3500, 1500];
    omz = [4e3, 4e3, 4500, 5500];
    
    mcz = rep_marginal_costs(otl, nn, marr, mvz, omz);
end


%--------------------------------------------------------------------------------------------
if selector == 10
    def1 = 25652;
    c_min = 24900;
    rep_tech_1(def1, c_min);
end


%--------------------------------------------------------------------------------------------
if selector == 11
    dept = 10e3;
    marr = .11;
    i_f = .05;
    nn = 15;
    actual = F_AiN(dept, marr, nn);
    fprintf("\n\tactual:  %10.0f\n", actual);
    reald = P_FiN(actual, i_f, nn);
    fprintf("\n\treal:  %10.0f\n", reald);
end


%--------------------------------------------------------------------------------------------
if selector == 12
    nn = 3;
    marr = .1;
    def_mcz = [1200, 1050, 1300]; % not increase
    chg_min = 1100;
    
    def_euac = rep_mc_2_euac(nn, marr, def_mcz);
    def_min_euac = 1129;
    rep_tech_2(def_min_euac, chg_min);
end


%--------------------------------------------------------------------------------------------
if selector == 13
    otl = 15e3;
    om = 7e3;
    mv = 10e3;
    marr = .1;
    nn = 1;
    mc = rep_marginal_costs(otl, nn, marr, mv, om);
    
    
end
