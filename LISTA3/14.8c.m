1;
# Escrevendo a expressao em (i)
function res = i(x, h0, h1)
    xp = x + h1;
    xn = x - h0;
    gpos = (e^(xp) - e^(x))/h1;
    gneg = (e^(x) - e^(xn))/h0;
    res = (gpos-gneg)/((h0+h1)/2);
endfunction

# Escrevendo a expressao em (ii)
function res = ii(x, h0, h1)
    xp = x + h1;
    xn = x - h0;
    res = 2 * (((e^(xp) - e^(x))/(xp-x) - (e^(x) - e^(xn))/(x-xn))/(xp-xn));
endfunction

# Encontrando f''(x) = e^x para x = 0
# h1 varia de 10^-1 a 10^-5 e h0 = h1/2
# Ja calculo os erros das aproximaçoes logo abaixo.
for h = -1 : -1 : -5
    h1 = 10^h;
    h0 = 0.5 * h1;
    printf("\nh0 = %d e h1 = %d\n", h0, h1);
    x = 0;
    item_i = i(x, h0, h1)
    item_ii = ii(x, h0, h1)
    error_i = 1 - item_i
    error_ii= 1 - item_ii
endfor

# As aproximaçoes realmente sao iguais! Conforme esperado :-)
# Quanto menor o h, mais precisa fica a aproximaçao.
