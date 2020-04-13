1;
# Tendo a funçao:
function res = f(x)
  res = (e.^x+e.^(-x))/2;
endfunction

# E a derivada:
function res = df(x)
  res = (e.^x-e.^(-x))/2;
endfunction

# O polinomio devera ser de grau 5 porque temos 6 dados
# Portanto: P5(x) = ax^5 + bx^4 + cx^3 + dx^2 + ex + g
# E P5'(x) = 5ax^4 + 4bx^3 + 3cx^2 + 2dx + e
# E P5''(X) = 20ax^3 + 12bx^2 + 6cx + 2d
# OBS: ddf(x) = f(x)
# Dai temos o sistema linear
# a + b + c + d + e + g = f(1)
# 243a + 81b + 27c + 9d + 3e + g = f(3)
# 5a + 4b + 3c + 2d + e = df(1)
# 405a + 108b + 27c + 6d + e = df(3)
# 20a + 12b + 6c + 2d = ddf(1) = f(1)
# 540a + 108b + 18c + 2d = ddf(3) = f(3)

# Resolvendo:
M = [1 1 1 1 1 1; 20 12 6 2 0 0; 243 81 27 9 3 1; 5 4 3 2 1 0; 540 108 18 2 0 0; 405 108 27 6 1 0];
N = [f(1); f(1); f(3); df(1); f(3); df(3)];
c = M\N

x = [0.5 : 0.001 : 3.5];
p = c(1).*x.^5 + c(2).*x.^4 + c(3).*x.^3 + c(4).*x.^2 + c(5).*x + c(6);

# Gerando o grafico das funçoes
figure(1)
semilogy(x, p)
xlabel("x");
ylabel("f(x)");
hold on
semilogy(x, f(x))

# Gerando o grafico do erro
figure(2)
semilogy(x, abs(f(x)-p))
xlabel("x");
ylabel("erro");

# Esse grafico foi o com menor erro dos 3. Embora o erro em torno de x=2 tenha aumentado
# em relaçao ao item b, nos pontos x=1 e x=3 o erro caiu muito. Alem disso, o erro do grafico
# todo caiu muito e as segundas derivadas conferiram mais suavidade ao formato do polinomio
# interpolador.
