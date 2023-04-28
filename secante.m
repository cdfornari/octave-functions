function [x, error, niter] = secante(f, x0, x1, tol, maxiter)
  niter = 0;
  error = tol + 1;

  while (error > tol) && (niter < maxiter)
    niter = niter + 1;
    x = x1 - f(x1) * (x1 - x0) / (f(x1) - f(x0));
    error = abs(x - x1);
    x0 = x1;
    x1 = x;
  endwhile

endfunction
