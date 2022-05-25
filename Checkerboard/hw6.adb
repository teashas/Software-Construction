with ada.text_IO, ada.integer_text_IO;
use ada.text_IO, ada.integer_text_IO;

package body hw6 is 

procedure getBoard(newBoard: in out board) is
  userInput: square;
begin
  put("Enter game board: ");

put(" about to loop");
  new_line;
  for row in reverse board'range(1) loop
    for col in board'range(2) loop
    get(userInput);
    newBoard(row, col) := userInput;
  end loop;
end loop;
end getBoard;

procedure printBoard(newBoard: board) is 
begin
  put("Here's the board: ");
  new_line(2);
  for row in reverse board'range(1) loop
    put("|---------------------------------------|");
    new_line;
    for col in board'range(2) loop
      if newBoard(row, col) = b then 
        put("| ");
        put("   ");
      else 
        put("| ");
        put(newBoard(row, col));
        put(" ");
      end if;
    
    end loop;
    put("|");
    new_line;
  end loop;
  put("|---------------------------------------|");
  new_line(2);
end printBoard;

procedure errorMessage(newBoard: in out board) is 
  blackCount: integer := 0;
  redCount: integer := 0;
begin
  for row in board'range(1) loop
    for col in board'range(2) loop
      if row mod 2 = 0 then
        if col mod 2 = 1 then 
          if newBoard(row, col) /= b then
            put("Square "); put(row,0); put(", "); put(col,0);
            put(" should have been blank but wasn't.");
            new_line;
          end if;
        end if;
      elsif row mod 2 = 1 then
        if col mod 2 = 0 then
          if newBoard(row, col) /= b then
            put("Square "); put(row,0); put(", "); put(col,0);
            put(" should have been blank but wasn't.");
            new_line;
          end if;
        end if;
      end if;
      
      if newBoard(row, col) = RC then 
        redCount := redCount + 1;
      elsif newBoard(row, col) = RK then 
        redCount := redCount + 2;
      elsif newBoard(row, col) = BC then 
        blackCount := blackCount + 1;
      elsif newBoard(row, col) = BK then 
        blackCount := blackCount + 2;
      end if;
    end loop;
  end loop;
  
  if redCount > 12 then 
    put("There are too many red pieces on the board.");
    new_line;
  end if;
  
  if blackCount > 12 then
    put("There are too many black pieces on the board.");
    new_line;
  end if;

end errorMessage;

end hw6;
