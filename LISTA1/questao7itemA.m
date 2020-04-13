# IMPORTANTE: Estou com um problema pra rodar esse código
# Ele só funciona assim $ octave --persist questao7itemA.m


# (i) Método de Horner
1;
function p = horner (x)
    # criando a lista de coeficientes
    c = [-512, 2304, -4608, 5376, -4032, 2016, -672, 144, -18, 1];
    p = c(10);
    for j = 9 : -1 : 1
        p = p * x + c(j);
    endfor
endfunction

# intervalo de x avaliados
# serão armazenados numa lista
resx = [];
for i = 1.92 : 0.001 : 2.08
    resx = [resx, horner(i)];
endfor

l = 1.92 : 0.001 : 2.08; # lista para comparar x com p(x)

figure (1);
plot (l, resx)
xlabel("x");
ylabel("p(x) com Horner");


# (ii) Cálculo direto
y = 1.92 : 0.001 : 2.08;
resy = (y .- 2) .^ 9;

figure (2);
plot (y, resy)
xlabel("x");
ylabel("p(x) diretamente");

# O gráfico com Método de Horner tem um ruído (que fica mais forte perto do zero)
# enquanto que o outro tem uma curva suave. Isso provavelmente ocorre devido
# a um erro de arredondamento.
