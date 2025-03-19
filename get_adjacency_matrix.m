function [Adj] = get_adjacency_matrix (Labyrinth)
  
  % initializez variabilele
  v = size(Labyrinth);
  count = 0;
  Adj = sparse(v(1) * v(2) + 2, v(1) * v(2) + 2);
  Adj(v(1) * v(2) + 1, v(1) * v(2) + 1) = 1;
  Adj(v(1) * v(2) + 2, v(1) * v(2) + 2) = 1;
  % creez matricea care retine pozitia fiecarui element
  for i = 1 : v(1)
    for j = 1 : v(2)
      count = count + 1;
      aux(i, j) = count;
    endfor
  endfor
  % creez matricea de adiacenta
  for i = 1 : v(1)
    for j = 1 : v(2)
      % gasesc reprezentarea pe biti a numarului
      decimalnumber = Labyrinth(i, j)
      b0 = mod(decimalnumber, 2);
      decimalnumber = floor(decimalnumber / 2)
      b1 = mod(decimalnumber, 2);
      decimalnumber = floor(decimalnumber / 2);
      b2 = mod(decimalnumber, 2);
      decimalnumber = floor(decimalnumber / 2);
      b3 = mod(decimalnumber, 2);
      % verific daca pozitia pe care ma aflu nu e pe margine
      if aux(i, j) <= v(2) & b3 == 0
          Adj(aux(i, j), v(2) * v(1) + 1) = 1
      elseif aux(i, j) > (v(1) - 1) * v(2) & b2 == 0
          Adj(aux(i, j), v(2) * v(1) + 1) = 1;
       elseif mod(aux(i, j), v(2)) == 1 & b0 == 0
          Adj(aux(i, j), v(2) * v(1) + 2) = 1;
       elseif mod(aux(i, j), v(2)) == 0 & b1 == 0
          Adj(aux(i, j), v(2) * v(1) + 2) = 1;
      else
          % daca e pe margine si pot ajunge in stare a de win
          if b3 == 0
            Adj(aux(i, j), aux(i - 1, j)) = 1;
            Adj(aux(i - 1, j), aux(i, j)) = 1;
          endif
          if b2 == 0
            Adj(aux(i, j), aux(i + 1, j)) = 1;
            Adj(aux(i + 1, j), aux(i, j)) = 1;
          endif
          % daca e pe margine si pot ajunge in starea de lose
          if b1 == 0
            Adj(aux(i, j), aux(i, j + 1)) = 1;
            Adj(aux(i, j + 1), aux(i, j)) = 1;
          endif
          if b0 == 0
            Adj(aux(i, j), aux(i, j - 1)) = 1;
            Adj(aux(i, j - 1), aux(i, j)) = 1;
          endif
      endif
    endfor
  endfor
endfunction
