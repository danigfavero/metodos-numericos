1;
function res = input(f, a, b, h, dfa)
  # P2(x) = ax^2 + bx + c
  # P2'(x) = 2ax + b
  # ai + bi(xi-xi) + c(xi -xi)^2 = f(xi)
  # ai + bi(xi+1 - xi) + ci(xi+1-xi)^2 = f(xi+1)
  # bi + 2ci(xi-xi) = df(xi-1)
  # Como (xi+1 - xi) = h

  M = [1 0 0; 1 h h^2; 0 1 0];
  df = dfa;
  while (a < b)
    N = [f(a); f(a+h); df];
    C = M\N;
    df = C[1] - 2*C[2]*h; #calculando a derivada que sera usada no proximo ponto
    D = [C; D];
    a = a + h;
  endwhile
  res = D;
endfunction
