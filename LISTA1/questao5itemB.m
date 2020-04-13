# Criando vetor de números de 1 a 10^20
i = 0 : 20;
x = 10.^i;

# Calculando ln no formato 1 = ln(x-(x^2-1)^(1/2))
res1 = log(x.-sqrt(x.^2.-1));

#Calculando ln no formato 2 = - ln(x+(x^2-1)^(1/2))
res2 = -log(x.+sqrt(x.^2.-1));

# Analisando x e os resultados nos dois formatos
table = [x; res1; res2]'

# A partir de 10^8, o formato 1 resulta em -infinito,
# enquanto que o formato 2 continua progredindo.
# O problema do formato 1, é que conforme o x cresce,
# [x - sqrt(x^2+1)] tende a zero e, devido a um erro de cancelamento,
# o computador tentará fazer a operação ln(0), que não existe.
