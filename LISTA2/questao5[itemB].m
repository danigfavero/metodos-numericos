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
# Dai temos o sistema linear
# a + b + c + d + e + g = f(1)
# 32a + 16b + 8c + 4d + 2e + g = f(2)
# 243a + 81b + 27c + 9d + 3e + g = f(3)
# 5a + 4b + 3c + 2d + e = df(1)
# 80a + 32b + 12c + 4d + e = df(2)
# 405a + 108b + 27c + 6d + e = df(3)

# Resolvendo:
M = [1 1 1 1 1 1; 32 16 8 4 2 1; 243 81 27 9 3 1; 5 4 3 2 1 0; 80 32 12 4 1 0; 405 108 27 6 1 0];
N = [f(1); f(2); f(3); df(1); df(2); df(3)];
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

# Esse grafico apresentou um erro muito menor ao se aproximar de x=2, deixando
# o grafico da interpolaçao muito mais parecido com o da funçao
