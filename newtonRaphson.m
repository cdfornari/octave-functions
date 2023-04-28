function [X,niter] = newtonRaphson(x,tol, maxiter)
  % Método de Newton para sistemas de ecuaciones no lineales % fi(x1,x2,...,xn) = 0, i = 1,2,...,n.
  % .......
  %
  if nargin == 1; tol = 1.0e4*eps; end
  if size(x,1) == 1; x = x'; end % x debe ser un vector columna
  #Vector de iteraciones
  iter = zeros(1, 1);
  # Se inicializa la matriz con los valores iniciales y el error en 1
  X=x; E=1.0;
  for i = 1:maxiter # se repite hasta el numero maximo de iteraciones establecido
    [y, jac] = f3(x); # se evalua la funcion y la jacobiana
    dx = jac\(-y); # se resuelve el sistema ecuaciones lineales
    x = x + dx; # se calcula la componente en x
    X=[X,x]; # se concatena el vector solucion con la solucion actual
    iter = [iter, i]; # se concatena esta iteracion al vector de iteraciones
    err=norm(dx,inf); # se calcula el error con la norma de infinito de dx, buscando el valor mayor en dx
    E=[E;err]; # se crea el vector de errores
    if err< tol # si el error actual es menor que la tolerancia se sale
      break
    endif
  endfor
  niter=i; X=[iter' X' E]; # se almacenan en una matriz los valores de las iteraciones, los resultados y los errores por cada iteracion
  X = [X']; # se traspone para arreglar formato
endfunction

function [y, jac] = f2(x) # sistema de ecuaciones de 2 variables
  y = zeros (2, 1); # se define la matriz para guardar el sistema
  y(1) = 3*x(1)^3-x(2)^2;
  y(2) = 3*x(1)*x(2)^2-x(1)^3 -1;
  jac = zeros (2,2); # se inicializa la jacobiana en 0
  jac(1,1) = 9*x(1)^2;
  jac(1,2) = -2*x(2);
  jac(2,1) = 3*x(2)^2-3*x(1)^2;
  jac(2,2) = 6*x(2)*x(1);
endfunction

function [y, jac] = f3(x)   # sistema de ecuaciones de 2 variables
  y = zeros (3, 1); # se define la matriz para guardar el sistema
  y(1) = x(1)^2 + x(2).^2-x(3)-2;
  y(2) = x(1)^2-x(2)^2-x(3);
  y(3)= 3*x(1)+2*x(2)-6*x(3);
  jac = zeros (3, 3); #se inicia la matriz jacobiana en 0
  jac(1,1) =2*x(1);
  jac(1,2) =2*x(2);
  jac(1,3) =-1;
  jac(2,1) =2*x(1) ; jac(2,2) = -2*x(2); jac(2,3) =-1 ; jac(3,1) =3;
  jac(3,2) =2;
  jac(3,3) =-6;
endfunction
