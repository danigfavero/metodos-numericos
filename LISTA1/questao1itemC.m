# Do item (b)
x0 = 1.2;
i = -20 : 0;
h = 10.^i;
error = abs(cos(1.2) - (sin(1.2+h)-sin(1.2.-h))./(2.*h));

# Calculando o erro aproximado
d_err = h.^2/6*cos(x0);

# Construindo o grafico
loglog (h,error)
hold on
loglog (h,d_err)
xlabel("h");
ylabel("Absolute error");

# Apesar de serem gráficos muito similares, o meu gráfico
# demonstra uma queda mais suave do que da figura 1.3
