function i_r = ii_real(i_market, i_inflation)
    i_r = (i_market - i_inflation) / (1 + i_inflation);
end