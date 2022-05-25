with ada.text_IO, ada.float_text_IO;
use ada.text_IO, ada.float_text_IO; 
package body store is

  procedure get(firstVector: out vector) is 
  userInput : float;
  begin 
    for i in firstVector'range loop
      put(" Enter a float for coordinate of a vector: ");
      get(userInput);
      firstVector(i) := userInput;
      new_line;
    end loop;
  end get;
  
  function "*"(firstVector: vector; secondVector: vector) return float is 
    sum: float := 0.0;
  begin
    for index in firstVector'range 
    loop
  		sum := sum + (firstVector(index) * secondVector(index));
    end loop;
    return sum;
  end "*";

end store;