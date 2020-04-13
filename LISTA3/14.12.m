function res = fpp(x, h)
    res = (sin(x+h) - 2.*sin(x) + sin(x-h))./(h.^2);
endfunction

k = 0 : 0.5 : 8;
h = 10.^(-k);
x = 1.2;
error = abs(-sin(1.2) - fpp(x,h));
loglog(h, error)

# Ate 10^-3 e' possivel ver o erro caindo linearmente (O(h)),
# devido 'a propria discretizaçao.
# Depois disso, conforme h diminui, os erros passa a crescer
# (por erros de arredondamento).
