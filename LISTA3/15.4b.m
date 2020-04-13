1;
function res = integral(a,b)
    res = (b-a)/2*(e^a + e^b) + (b-a)^2/12 * (e^a - e^b);
endfunction

# integrando no intervalo [0,1]
int1 = integral(0,1)
error1 = (e-1) - int1

# integrando no intervalo [0,0.9]
int2 = integral(0.9,1)
error2 = (e-e^(0.9)) - int2

# Essa aproximaçao tambem e' melhor quando aplicada em intervalos menores
# Alem disso, o erro se aproxima ao de Simpson, demonstrando mais precisao
# do que a trapezoidal comum (e a do ponto medio, claro).
