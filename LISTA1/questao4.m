# Utilizando a função da questão 3 item a
1;
function res = arredonda(x, n)
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
endfunction


# (i) direta
i = 0;
for j = 1 : 10000
    i += 1/j;
endfor
i

# (ii) arredondando
m = 0;
for i = 1 : 10000
    m = arredonda((m + 1/i),5);
endfor
ii = arredonda(m,5)

# (iii) arredondando na ordem inversa
o = 0;
for i = 10000 : -1 : 1
    o = arredonda((o + 1/i),5);
endfor
iii = arredonda(o,5)

# Obtive:
# i =  9.7876
# ii =  9.6611
# iii =  9.7478
# O arredondamento do somatório na ordem inversa aproxima melhor
# do que na ordem normal.
# Enquanto o arredondamento na ordem inversa causou um erro de ~0.03,
# o na ordem normal causou um erro de ~0.12
