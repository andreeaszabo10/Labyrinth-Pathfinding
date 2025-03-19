function [Link] = get_link_matrix (Labyrinth)
  
  % initializez matricea link si pun valorile pentru win si lose
  v=size(Labyrinth);
  count=0;
  Link = sparse(v(1) * v(2) + 2, v(1) * v(2) + 2);
  Link(v(1) * v(2) + 1, v(1) * v(2) + 1) = 1;
  Link(v(1) * v(2) + 2, v(1) * v(2) + 2) = 1;
  % initializez matricea care retine pozitia fiecarui element
  for i = 1 : v(1)
    for j = 1 : v(2)
      count = count + 1;
      aux(i, j) = count;
    endfor
  endfor
  % verific legaturile pentru fiecare element al matricei Labyrinth
  for i = 1 : v(1)
    for j = 1 : v(2)
      % initializez bitii pentru numarul curent
      decimalnumber = Labyrinth(i, j)
      b0 = mod(decimalnumber, 2);
      decimalnumber = floor(decimalnumber / 2);
      b1 = mod(decimalnumber, 2);
      decimalnumber = floor(decimalnumber / 2);
      b2 = mod(decimalnumber, 2);
      decimalnumber = floor(decimalnumber / 2);
      b3 = mod(decimalnumber, 2);
      var = 0;
      % verific in cate moduri pot sa o iau din punctul in care ma aflu
      if b3 == 0
        var = var + 1;
      endif
      if b2 == 0
        var = var + 1;
      endif
      if b1 == 0
        var = var + 1;
      endif
      if b0 == 0
        var = var + 1;
      endif
      % adaug elementele la fel ca la matricea de adiacenta, doar ca impart 1 la numarul de moduri in care pot sa o iau
      if aux(i, j) <= v(2) & b3 == 0
          Link(aux(i, j), v(1) * v(2) + 1) = 1 / var;
      elseif aux(i, j) > (v(1) - 1) * v(2) & b2 == 0
          Link(aux(i, j), v(1) * v(2) + 1) = 1 / var;
       elseif mod(aux(i, j), v(2)) == 1 & b0 == 0
          Link(aux(i, j), v(1) * v(2) + 2) = 1 / var;
       elseif mod(aux(i, j), v(2)) == 0 & b1 == 0
          Link(aux(i, j), v(1) * v(2) + 2) = 1 / var;
      else
          % cazul in care pot ajunge in starea de Win pe sus
          if b3 == 0
            Link(aux(i, j),aux(i - 1, j)) = 1 / var;
            % daca nu se afla pe linia de sus
            if aux(i, j) > v(2)
              decimalnumber = Labyrinth(i - 1, j)
              bit0 = mod(decimalnumber, 2);
              decimalnumber = floor(decimalnumber / 2)
              bit1 = mod(decimalnumber, 2);
              decimalnumber = floor(decimalnumber / 2);
              bit2 = mod(decimalnumber, 2);
              decimalnumber = floor(decimalnumber / 2);
              bit3 = mod(decimalnumber, 2);
              var1 = 0;
              if bit3 == 0
                var1 = var1 + 1;
              endif
              if bit2 == 0
                var1 = var1 + 1;
              endif
              if bit1 == 0
                var1 = var1 + 1;
              endif
              if bit0 == 0
                var1 = var1 + 1;
              endif
              Link(aux(i - 1, j), aux(i, j)) = 1 / var1;
            endif
          endif
          % pot ajunge in starea de Win pe jos
          if b2 == 0
            Link(aux(i, j),aux(i + 1, j)) = 1 / var;
            % daca nu se afla pe linia de jos
            if aux(i, j) <= (v(1) - 1) * v(2)
              decimalnumber = Labyrinth(i + 1, j)
              bit0 = mod(decimalnumber, 2);
              decimalnumber = floor(decimalnumber / 2)
              bit1 = mod(decimalnumber, 2);
              decimalnumber = floor(decimalnumber / 2);
              bit2 = mod(decimalnumber, 2);
              decimalnumber = floor(decimalnumber / 2);
              bit3 = mod(decimalnumber, 2);
              var1 = 0;
              if bit3 == 0
                var1 = var1 + 1;
              endif
              if bit2 == 0
                var1 = var1 + 1;
              endif
              if bit1 == 0
                var1 = var1 + 1;
              endif
              if bit0 == 0
                var1 = var1 + 1;
              endif
              Link(aux(i + 1, j), aux(i, j)) = 1 / var1;
            endif
          endif
          % pot ajunge in starea de lose
          if b1 == 0
            Link(aux(i, j), aux(i, j + 1)) = 1 / var;
            % daca  nu se afla pe coloana din stanga
            if mod(aux(i, j), v(2)) != 1
              decimalnumber = Labyrinth(i, j + 1)
              bit0 = mod(decimalnumber, 2);
              decimalnumber = floor(decimalnumber / 2)
              bit1 = mod(decimalnumber, 2);
              decimalnumber = floor(decimalnumber / 2);
              bit2 = mod(decimalnumber, 2);
              decimalnumber = floor(decimalnumber / 2);
              bit3 = mod(decimalnumber, 2);
              var1 = 0;
              if bit3 == 0
                var1 = var1 + 1;
              endif
              if bit2 == 0
                var1 = var1 + 1;
              endif
              if bit1 == 0
                var1 = var1 + 1;
              endif
              if bit0 == 0
                var1 = var1 + 1;
              endif
              Link(aux(i, j + 1), aux(i, j)) = 1 / var1;
            endif
          endif
          % pot ajunge in starea de lose
          if b0 == 0
            Link(aux(i, j), aux(i, j - 1)) = 1 / var;
            % daca nu se afla pe coloana din dreapta
            if mod(aux(i, j), v(2)) != 0
              decimalnumber = Labyrinth(i, j - 1)
              bit0 = mod(decimalnumber, 2);
              decimalnumber = floor(decimalnumber / 2)
              bit1 = mod(decimalnumber, 2);
              decimalnumber = floor(decimalnumber / 2);
              bit2 = mod(decimalnumber, 2);
              decimalnumber = floor(decimalnumber / 2);
              bit3 = mod(decimalnumber, 2);
              var1 = 0;
              if bit3 == 0
                var1 = var1 + 1;
              endif
              if bit2 == 0
                var1 = var1 + 1;
              endif
              if bit1 == 0
                var1 = var1 + 1;
              endif
              if bit0 == 0
                var1 = var1 + 1;
              endif
              Link(aux(i, j - 1), aux(i, j)) = 1 / var1;
            endif
          endif
      endif
    endfor
  endfor
endfunction
