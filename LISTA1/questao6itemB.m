# Utilizando a função da questão 3 item a
1;
function res = arredonda(x, n)
    neg = 0;
    if (x < 0)
        x = -x;
        neg = 1;
    endif
    aux = x;
    count = 0;
    while (aux >= 1)
        aux = idivide(aux,10);
        count += 1;
    endwhile
    if (count > n)
        x = idivide(x,10^(count-n-1));
        if (mod(x,10) > 5)
            x = idivide(x,10);
            res = (x+1) * 10^(count-n);
        else
            x = idivide(x,10);
            res = x * 10^(count-n);
        endif
    else
        exp = n-count;
        x = x * 10^(exp+1);
        x = idivide(x, 1);
        if (mod(x,10) > 5)
            res = (idivide(x,10) + 1) * 10^(-exp);
        else
            res = idivide(x,10) * 10^(-exp);
        endif
    endif
    if (neg == 1)
        res = -res;
    endif
endfunction

# Lista dos xi
xi =  1 : 10
n = 10;

# Cálculo da média
media = sum(xi)/n;

# Formato 1
s1 = 0;
for xi = 1 : n
    calc = s1 + (xi - media)^2;
    s1 = arredonda(calc,2);
endfor
s1 = arredonda(1/n*s1,2)

# Formato 2
s2 = 0;
for xi = 1 : n
    calc = s2 + xi^2;
    s = arredonda(calc,2);
endfor
s2 = arredonda((1/n*s2)-media^2,2)

# Produzi um exemplo de 1 a 10, no qual analiticamente sigma quadrado é 8.25
# A diferença de acurácia dos dois formatos é gritante: o primeiro tem resultado
# "8", que é próximo do esperado, enquanto que o segundo tem resultado "-30",
# muito distante da resposta correta.
# Isso indica que o ganho em custo computacional do formato 2 pode não ser bom o
# suficiente para um resultado tão discrepante.
