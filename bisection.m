function [c, n] = bisection(f, a, b, tol, max_iter)
% Implementación del método de bisección para encontrar una raíz de la función f
% en el intervalo [a, b], con una tolerancia tol y un número máximo de iteraciones max_iter.

fa = f(a);
fb = f(b);
n = 0;

if fa*fb > 0
    error("La función no cambia de signo en el intervalo [a, b]")
endif

while (b-a)/2 > tol && n < max_iter
    c = (a+b)/2;
    fc = f(c);
    if fc == 0
        return
    endif
    if fa*fc < 0
        b = c;
        fb = fc;
    else
        a = c;
        fa = fc;
    endif
    n = n+1;
endwhile

c = (a+b)/2;
endfunction
