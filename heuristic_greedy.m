function [path] = heuristic_greedy (start_position, probabilities, Adj)
  
    % am initializat variabilele
    n = length(probabilities) - 2;
    visited = zeros(n + 2, 1);
    path = start_position;
    visited(start_position) = 1;
    while !isempty(path)
      % pozitia este ultimul element
        position = path(end);
        % am ajuns in pozitia de Win
        if position == n + 1
          path = transpose(path);
          return;
        endif
        % verific unde pot sa ma duc
        neighbours = find(Adj(position, :) > 0);
        notvisited = neighbours(!visited(neighbours));
        if isempty(notvisited)
          % elimin ultimul element
            path = path(1 : end - 1);
            % verific cea mai mare probabilitate
            [!, neighbour] = max(probabilities(notvisited));
            % trec la vizitate
            visited(notvisited(neighbour)) = 1;
            % adaug la path
            path = [path, notvisited(neighbour)];
        else
            % verific cea mai mare probabilitate
            [!, neighbour] = max(probabilities(notvisited));    
            visited(notvisited(neighbour)) = 1;
            % adaug la path
            path = [path, notvisited(neighbour)];
        endif
    endwhile
    
endfunction
