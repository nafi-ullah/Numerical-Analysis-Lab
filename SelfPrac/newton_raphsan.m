

function retval = newton_raphsan ()

  function [y,dy] = f(x)
    y = x.^3 - 3*x - 5;
    dy = 3*x.^2 - 3;
  endfunction

  x0 = 2; %jeita r jonno y er value 0 er kasakasi hobe
  tol = 1e-6;

  roots = [];
  tangents = [];
  iterations= 0;

  while true
    [y, dy] = f(x0);
    x1 = x0 - y/dy;

    roots = [roots; x1];
    tangents = [tangents; [x0, y, dy]];

    if abs(x1-x0) < tol
      break;
    endif

    x0 = x1;
    iterations = iterations + 1;


  endwhile

  fprintf('%d iterations and got the root %f\n', iterations, roots(end));

  x = linspace(-3,3,100);
  [y,dy] = f(x);

  figure;
  plot(x,y);
  hold on;

  plot(roots, f(roots), 'or');





endfunction
