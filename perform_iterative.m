function [x, err, steps] = perform_iterative (G, c, x0, tol, max_steps)

  % initializare variabile
  steps = 0;
  prev = x0;
  % pana cand se atinge numarul maxim de pasi sau eroarea devinde mai mica decat tol
  while 1
    % calculez x-ul
    x = G * prev + c;
    steps = steps + 1;
    % calculez eroarea
    err = norm(x - prev);
    prev = x;
    % verific daca algoritmul trebuie oprit
    if steps == max_steps || err < tol
      return;
    endif
  endwhile
   
endfunction
