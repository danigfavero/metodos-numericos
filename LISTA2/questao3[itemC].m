# Para b = pi/2
n = 5;
i = [0 : 1 : n];
x = 0;

# Calculando os pontos
xi = [];
for i = 1:5
  xi = [xi; cos(((2*i+1)*pi)/(2*n))];
endfor

a = 0;
b = pi/2;
# Projetando no intervalo [-1,1]
xi = a + (b - a)* (xi+1)/2;

# O polinomio devera ser de grau 4 porque temos 5 dados
# Portanto: P4(x) = ax^4 + bx^3 + cx^2 + dx + e
# Dai temos o seguinte sistema linear:

M = [1 xi(1) xi(1)^2 xi(1)^3 xi(1)^4;
1 xi(2) xi(2)^2 xi(2)^3 xi(2)^4;
1 xi(3) xi(3)^2 xi(3)^3 xi(3)^4;
1 xi(4) xi(4)^2 xi(4)^3 xi(4)^4;
1 xi(5) xi(5)^2 xi(5)^3 xi(5)^4];

yi = sin(xi);
R = M\yi;

# Gerando o grafico
i = [0 : 0.001 : b]
p =  R(5)*i.^4 + R(4)*i.^3 + R(3)*i.^2 + R(2)*i + R(1);
figure(1)
plot(i,sin(i))
xlabel("x");
ylabel("f(x)");
hold on
plot(i,p)
hold off
pause();

# Para b = pi

n = 5;
i = [0 : 1 : n];
x = 0;

# Calculando os pontos
xi = [];
for i = 1:5
  xi = [xi; cos(((2*i+1)*pi)/(2*n))];
endfor

a = 0;
b = pi;
# Projetando no intervalo [-1,1]
xi = a + (b - a)* (xi+1)/2;

M = [1 xi(1) xi(1)^2 xi(1)^3 xi(1)^4;
1 xi(2) xi(2)^2 xi(2)^3 xi(2)^4;
1 xi(3) xi(3)^2 xi(3)^3 xi(3)^4;
1 xi(4) xi(4)^2 xi(4)^3 xi(4)^4;
1 xi(5) xi(5)^2 xi(5)^3 xi(5)^4];

yi = sin(xi);
R = M\yi;

# Gerando o grafico
i = [0 : 0.001 : b]
p =  R(5)*i.^4 + R(4)*i.^3 + R(3)*i.^2 + R(2)*i + R(1);
figure(2)
plot(i,sin(i))
xlabel("x");
ylabel("f(x)");
hold on
plot(i,p)
hold off

pause();

# Para pi/2, a interpolaçao ficou mais precisa.
