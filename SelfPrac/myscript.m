function retval = myscript ()

  function y = f(x)
    y = x.^2 - 4;
  endfunction

  a = 0;
  b = 3;
  t = 1e-6;

  roots = [];
  iterations = 0;

  while (b-a) / 2 > t
    c = (a*f(b) - b*f(a))/(f(b)-f(a));
    roots = [roots; c];

    if f(c) == 0
      break;
    elseif  f(a) * f(c) > 0
      a = c;
    else
      b = a;
    endif

    iterations = iterations + 1;
  endwhile

  fprintf('%d iterations needed: %f\n', iterations, roots(end));

  for i = 1:length(roots)
    fprintf('%d no root: %d\n', i, roots(i));
  endfor


endfunction
