function res = derivate(x,h)
    res = (e^(x+2*h) - e^(x-2*h) - 2*e^(x+h) + 2*e^(x-h))/2*h^3;
endfunction

for i = -1 : -1 : -9
    h = 10^i
    derivada = derivate(0, 10^i)
endfor

# O melhor resultado da aproximaçao foi para h = 10^-3.
# Passos muito pequenos levaram a erros cada vez maiores.
# Mas para maiores valores de h, para 10^-1 a derivada deu
#  1.0025e-06, depois 1.0000e-12(10^-2) e depois 1.0000e-18 (10^-3),
# revelando o carater de segunda ordem da aproximaçao.
