with ada.text_IO, ada.integer_text_IO, ada.float_text_IO;
use ada.text_IO, ada.integer_text_IO, ada.float_text_IO; 
with store;
use store;
procedure main is

  firstVector: vector;
  secondVector: vector;
  
begin
   get(firstVector);
   get(secondVector);
   put(" The dot product is ");
   put(firstVector * secondVector);
   new_line(2);
end main;

