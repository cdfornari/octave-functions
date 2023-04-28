function [x, n] = newton(f, df, x0, tol, max_iter)
n = 0;
x = x0;

  while abs(f(x)) > tol && n < max_iter
    x = x - f(x) / df(x);
    n = n+1;
  endwhile
endfunction
