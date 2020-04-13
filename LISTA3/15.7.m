1;

# METODO DO PONTO MEDIO
function res = midpoint(f, a, b, r)
    h = (b-a)/r;
    res = 0;
    for i = a : h : b-h
        res += ((i+h)-i)*f((i+(i+h))/2);
    endfor
endfunction

# METODO TRAPEZOIDAL
function res = trapezoidal(f, a, b, r)
    h = (b-a)/r;
    res = 0;
    for i = a : h : b-h
        res += ((i+h)-i)*(f(i)+f(i+h))/2;
    endfor
endfunction

# METODO DE SIMPSON
function res = simpson(f, a, b, r)
    h = (b-a)/r;
    res = 0;
    for i = a : h : b-h
        res += (((i+h)-i)/6)*(f(i) + 4*f((i+(i+h))/2) + f(i+h));
    endfor
endfunction


# ITEM A
function res = fa(x)
    res = 4/(1+x^2);
endfunction

printf("ITEM A:\n")
r = 2;
while r != 64
    printf("r = %d\n", r)
    printf("MIDPOINT: ");
    midpoint(@fa, 0, 1, r)
    printf("TRAPEZOIDAL: ");
    trapezoidal(@fa, 0, 1, r)
    printf("SIMPSON: ");
    simpson(@fa, 0, 1, r)
    r = r*2;
endwhile

# ITEM B
function res = fb(x)
    res = sqrt(x);
endfunction

printf("\nITEM B:\n")
r = 2;
while r != 64
    printf("r = %d\n ", r)
    printf("MIDPOINT: ");
    midpoint(@fb, 0, 1, r)
    printf("TRAPEZOIDAL: ");
    trapezoidal(@fb, 0, 1, r)
    printf("SIMPSON: ");
    simpson(@fb, 0, 1, r)
    r = r*2;
endwhile

# Simpson e' sempre a aproximaçao mais precisa das integrais.
# Para o item A, o trapezoidal foi mais preciso.
# Interessante, no item B, o midpoint foi mais preciso.
# quanto menor o h, menor o erro de discretizaçao.
