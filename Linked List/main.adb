with ada.text_IO, ada.integer_text_IO;
use ada.text_IO, ada.integer_text_IO; 
with hw5;
use hw5;

procedure main is

  --Q : listPtr := null;
  --QTemp : listPtr := null; 
  userInput : character; 
  
begin 
  
  loop
    put("What do you want to do? [i for insert, r for remove, q for quit]: ");
    get(userInput);
    
    if userInput = 'i' then 
      insertQueue;
    elsif userInput = 'r' then 
      removeQueue;
    elsif userInput = 'q' then
      exit;
    end if;
  exit when userInput = 'q';
  end loop;

end main;
  
  

