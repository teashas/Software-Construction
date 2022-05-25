with ada.text_IO, ada.integer_text_IO; 
use ada.text_IO; use ada.integer_text_IO;
procedure hw2 is

userInput : integer;
countTotal : integer :=0;
countPos : integer := 0;
countNeg :  integer := 0;
largestTotal : integer;
largestPos : integer;
largestNeg : integer;
smallestTotal : integer;
smallestPos : integer;
smallestNeg : integer;

begin

put("Enter an integer: ");
get(userInput);
countTotal := countTotal + 1;
if (userInput > 0) then
  countPos := countPos + 1;
  largestTotal := userInput;
  largestPos := userInput;
  smallestPos := userInput;
  smallestTotal := userInput;
  largestNeg := 0;
  smallestNeg := 0;
else 
  countNeg := countNeg + 1;
  largestTotal := userInput;
  largestPos := 0;
  smallestPos := 0;
  smallestTotal := userInput;
  largestNeg := userInput;
  smallestNeg := userInput;
end if;

loop

put("Enter an integer: ");
get(userInput);


if (userInput /= 0) then
  -- keeps track of all integers.
  countTotal := countTotal + 1;
  if (userInput > largestTotal) then
    largestTotal := userInput;
  elsif (userInput < smallestTotal) then
    smallestTotal := userInput;
  end if;
  
  -- keeps track of positive integers.
  if (userInput > 0) then
    countPos := countPos + 1;
    if (userInput > largestPos) then
      largestPos := userInput;
    elsif (userInput < smallestPos) then
      smallestPos := userInput;
    end if;
  
  --keeps track of negative integers.
  else if (userInput < 0) then
    countNeg := countNeg + 1;
    if (userInput > largestNeg) then
      largestNeg := userInput;
    elsif (userInput < smallestNeg) then
      smallestNeg := userInput;
    end if;
  end if;
  
end if;
  
end if;

exit when userInput = 0;
end loop;

put("In total, you entered ");
put(countTotal);
put(" numbers;");
put("the largest was ");
put(largestTotal);
put("; the smallest was ");
put(smallestTotal);
new_line;

put("Total positive numbers entered: ");
put(countPos);
if countPos = 0 then
  put(". No positive numbers were entered.");
else 
  put("; the largest was ");
  put(largestPos);
  put("; the smallest was ");
  put(smallestPos);
end if;
new_line;

put("Total negative numbers entered: ");
put(countNeg);
if countNeg = 0 then
  put(". No negative numbers were entered.");  
else 
  put("; the largest was ");
  put(largestNeg);
  put("; the smallest was ");
  put(smallestNeg);
end if; 

end hw2; 
