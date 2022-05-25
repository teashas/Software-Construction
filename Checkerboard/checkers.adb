with ada.text_io, ada.integer_text_io, hw6;
use ada.text_io, ada.integer_text_io, hw6;

procedure checkers is 
  game: board;
begin
  getBoard(game);
  printBoard(game);
  errorMessage(game);
end checkers;