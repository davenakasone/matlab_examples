function i_f = ii_inflation(price_future, price_base, periods)
    temp = price_future / price_base;
    tempp = temp.^(1/periods);
    i_f = tempp - 1;
end