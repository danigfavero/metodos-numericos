1;
# Tendo a funçao:
function res = f(x)
  res = (e.^x+e.^(-x))/2;
endfunction

# E a derivada:
function res = df(x)
  res = (e.^x-e.^(-x))/2;
endfunction

# O polinomio devera ser de grau 3 porque temos 4 dados
# Portanto: P3(x) = ax^3 + bx^2 + cx + d
# E P3'(x) = 3ax^2 + 2xb + c
# Dai temos o sistema linear
# a + b + c + d = f(1)
# 27a + 9b + 3c + d = f(3)
# 3a + 2b + c = df(1)
# 27a + 6b + c = df(3)

# Resolvendo:
M = [1 1 1 1; 27 9 3 1; 3 2 1 0; 27 6 1 0];
N = [f(1); f(3); df(1); df(3)];
c = M\N

x = [0.5 : 0.001 : 3.5];
p = c(1).*x.^3 + c(2).*x.^2 + c(3).*x + c(4);

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
