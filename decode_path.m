function [decoded_path] = decode_path (path, lines, cols)
  
  % initialzez variabilele
  count = 0;
  sizee = length(path) - 1;
  decoded_path = zeros(sizee, 2);
  % scot ultimul element
  path = path(1 : end - 1);
  % cat timp mai sunt elemente in path
	while !isempty(path)
    count = count + 1;
    % pornesc de la primul element
    position = path(1);
    line = 1;
    column = mod(position, cols);
    % gasesc coloana pe care se afla pozitia
    if mod(position, cols) == 0
      column = cols;
    endif
    % gasesc linia pe care se afla
    if position == cols
      line = 1;
    else
      while floor(position / cols) != 0
        % scad 1 din pozitie daca mod-ul e 0 ptr ca imi da linia cu 1 mai mare decat trebuie
        if mod(position, cols) == 0 & position > cols
         position = position - 1;
        endif
        position = position - cols;
        line = line + 1;
      endwhile
    endif
    % adaug linie si coloana la matrice
    decoded_path(count, 1) = line;
    decoded_path(count, 2) = column;
    path = path(2 : end);
  endwhile
endfunction