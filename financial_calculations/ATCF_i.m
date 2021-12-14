function atcfi = ATCF_i(revenue, expense, tax_i, depreciation)
    atcfi = (revenue - expense) * (1 - tax_i) + depreciation * tax_i;
end

% after tax cash flow for income      rev-exp = BTCF