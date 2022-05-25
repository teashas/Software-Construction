with ada.text_IO, ada.integer_text_IO;
use ada.text_IO, ada.integer_text_IO;
with hw3_thing; 

procedure hw3_main is
begin
  hw3_thing(count, average);
  put("You entered "); put(count, 0); put(" integers; ");
  put("their average is "); put(average, 0); new_line(2);
end hw3_main;