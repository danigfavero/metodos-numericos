# Criando o vetor que será usado nas operações
x0 = 1.2;
i = 0 : -1 : -20;
h = 10.^i;

# Usando a identidade
aprox = (2./h).*cos(x0.+h./2).*sin(h./2);

#Calculando o erro
error = abs(cos(1.2) .- aprox);
format long e

table = [h; aprox; error]'

# h       : erro do livro
# 1.e-8   : 4.361050e-10
# 1.e-9   : 5.594726e-8
# 1.e-10  : 1.669696e-7
# 1.e-11  : 7.938531e-6
# 1.e-13  : 4.250484e-4
# 1.e-15  : 8.173146e-2
# 1.e-16  : 3.623578e-1

# Nesta implementação, o erro não aumenta depois de 10^-8 (com um desvio em 10^-18)
# demonstrando uma melhora de acurácia. Portanto os erros de cancelamento
# realmente foram melhorados.
# No fim, essa implementação conseguiu levar o erro a 0.
