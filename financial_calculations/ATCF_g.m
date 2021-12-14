function atcfg = ATCF_g(sale, tg, book)
    atcfg = sale * (1 - tg) + book * tg;
end

% after tax cash flow for capital gains