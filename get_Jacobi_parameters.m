function [G, c] = get_Jacobi_parameters (Link)
  
  % initializez variabilele
  v = size(Link);
	G = sparse(v(1) - 2, v(2) - 2);
  c = sparse(v(1) - 2);
  % adaug in matricea G elementele nenule din Link
  for i = 1 : v(1) - 2
    for j = 1 : v(2) - 2
      if Link(i, j) != 0
        G(i, j) = Link(i, j);
      endif
    endfor
  endfor
  % adaug elementele din coloana de Win in vectorul c
  for i = 1 : v(2) - 2
    c(i) = Link(i, v(1) - 1);
  endfor
  c = transpose(c);
  
endfunction