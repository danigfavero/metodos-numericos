# Calculando erro de 10^-1 a 10^-7
x0 = 1.2;
i = -1 : -1 : -7;
h = 10.^i;
error = abs(cos(1.2) - (sin(1.2+h)-sin(1.2.-h))./(2.*h);
table = [h; error]'
# Comparando com o livro
    # h   : meu erro   : erro do livro
    #1e-1 : 6.0363e-04 : 4.716676e-2
    #1e-2 : 6.0393e-06 : 4.666196e-3
    #1e-3 : 6.0393e-08 : 4.660799e-4
    #1e-4 : 6.0362e-10 : 4.660256e-5
    #1e-7 : 1.1901e-10 : 4.619326e-8

# Meu erro é menor do que o do livro, embora eles tendam a ficar parecidos.
# A aproximação feita nesta questão perece melhor do que a do livro.
