1;
function res = arredondaInterna(x, n)
    neg = 0; # Boolean para negativos
    if (x < 0)
        x = -x; # Mexer com negativos como se fossem positivos
        neg = 1;
    endif
    aux = x;
    count = 0;
    # Contando o número de dígitos antes do "." (inteiros)
    while (aux >= 1)
        aux = idivide(aux,10);
        count += 1;
    endwhile
    # Caso em que posso descartar algarismos fracionários
    if (count > n)
        x = idivide(x,10^(count-n-1));
        # Arredondando considerando o próximo dígito depois do n-ésimo
        if (mod(x,10) > 5)
            x = idivide(x,10);
            res = (x+1) * 10^(count-n);
        else
            x = idivide(x,10);
            res = x * 10^(count-n);
        endif
    # Caso em que preciso analisar algarismos depois do "."
    else
        exp = n-count;
        # Tranformando o número em um inteiro
        x = x * 10^(exp+1);
        x = idivide(x, 1);
        # Arredondando considerando o próximo dígito depois do n-ésimo
        if (mod(x,10) > 5)
            res = (idivide(x,10) + 1) * 10^(-exp);
        else
            res = idivide(x,10) * 10^(-exp);
        endif
    endif
    if (neg == 1) # Restaura o negativo
        res = -res;
    endif
endfunction

function res = arredonda(x, n)
    if (typeinfo(x) == "scalar")
        res = arredondaInterna(x, n);
    else
        res = arrayfun(@(a) arredondaInterna(a, n), x);
    endif
endfunction

# Unit test
q = arredonda([-4.253, ],2)
