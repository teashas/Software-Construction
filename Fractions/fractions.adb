with ada.text_io, ada.integer_text_io;               
use ada.Text_IO, ada.integer_text_io;
with hw10;  use hw10;

procedure fractions is
  controlChar: character;
begin
  getFraction;
  new_line;
  get(controlChar);
  while controlChar /= 'q' loop
    getFraction;
    new_line;
    get(controlChar);
    new_line;
  end loop;
end fractions;