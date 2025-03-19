function [Labyrinth] = parse_labyrinth(file_path)
  
  % deschid fisierul si citesc dimensiunile
	file = fopen(file_path, 'rt');
  size = fscanf(file, '%d', [1 2]);
  m = size(1);
  n = size(2);
  % citesc fiecare element al matricei
  for i = 1 : m
    for j = 1 : n
      number = fscanf(file, '%d', [1 1]);
      Labyrinth(i, j) = number;
    endfor
  endfor
  fclose(file);
  
endfunction