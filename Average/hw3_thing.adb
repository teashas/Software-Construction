with ada.text_IO, ada.integer_text_IO, ada.float_text_IO; 
use ada.text_IO; use ada.integer_text_IO; use ada.float_text_IO;

procedure hw3_thing is
  (count: integer := -1;
   average: float := 0.0) is

userInput : integer;
sum : integer := 0;

begin
  loop
    put("Enter an integer: ");
    get(userInput);
    sum := userInput + sum;
    count := count + 1;
    exit when userInput = 0;
  end loop;

average := float(sum) / float(count);
end hw3_thing; 