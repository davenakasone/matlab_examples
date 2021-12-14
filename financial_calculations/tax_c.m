function tic = tax_c(fed_tax, state_tax)
    tic = fed_tax + state_tax - (fed_tax * state_tax); 
end