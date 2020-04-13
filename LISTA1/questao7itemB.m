# Usando a função bisect do livro
1;
function p = bisect(func, a, b, fa, fb, atol)
    n = ceil ( log2 (b-a) - log2 (2*atol));
    for k = 1 : n
        p = (a+b)/2;
        #fp = feval(func,p);
        fp = func(p);
        if fa * fp < 0
            b = p;
            fb = fp;
        else
            a = p;
            fa = fp;
        endif
    endfor
    p = (a+b)/2;
endfunction

# Aplicando no formato extendido
function res = f1(x)
    res = -512 + x*(2304 + x*(-4608 + x*(5376 + x*(-4032 +
        x*(2016 + x*(-672 + x*(144+  x*(-18 + x))))))));
endfunction

format long e
disp('Formato expandido')
resp1 = bisect(@f1, 1.92, 2.08, f1(1.92), f1(2.08), 10^-6)

# Aplicando no formato (x-2)^9
function res = f2(x)
    res = (x-2)^9;
endfunction

disp('Com Horner')
resp2 = bisect(@f2, 1.92, 2.08, f2(1.92), f2(2.08), 10^-6)

# A solução com Horner é mais precisa do que com a forma (x-2)^9
# com uma diferença de ~0.04
