with ada.text_io, ada.integer_text_io;               
use ada.Text_IO, ada.integer_text_io; 

package body hw10 is 
  procedure getFraction is
    charRead : character;
  begin
    put("? ");
    get(f1.num); get(charRead); get(f1.den);
    while operation = ' ' loop
      get(operation);
    end loop; 
    get(operation);
    while operation = ' ' loop
      get(operation);
    end loop;
    get(f2.num); get(charRead); get(f2.den);
    new_line;
    printAns(f1, f2);
  end getFraction;
  
  function "*"(f1, f2: fraction) return fraction is
    result : fraction;
  begin
    result.num := f1.num * f2. num;
    result.den := f1.den * f2.den;
    result := simplify(result);
    return result;
  end "*";
  
  function "+"(f1, f2: fraction) return fraction is
    result: fraction;
  begin
    result.num := (f1.num * f2.den) + (f2.num * f1.den);  
    result.den := f1.den * f2.den;
    result := simplify(result);
    return result;
  end "+"; 
  
  function gcd(f1 : fraction) return Integer is
      M : Integer := f1.num;
      N : Integer := f1.den;
      T : Integer;
   begin
      while N /= 0 loop
         T := M;
         M := N;
         N := T mod N;
      end loop;
      return M;
   end gcd;
  
  function simplify(f1: fraction) return fraction is
    result : fraction;
  begin 
      result.num := f1.num / gcd(f1);
      result.den := f1.den / gcd(f1);
    return result;
  end simplify;
  
  procedure printAns(f1, f2: fraction) is
  result : fraction;
  begin
    if operation = '+' then 
      result := "+"(f1, f2);
      put(f1.num,0); put("/"); put(f1.den,0); 
      put(" + ");
      put(f2.num,0); put("/"); put(f2.den,0);
      put(" = "); 
      if result.num = result.den then 
        put(" 1");
      else
        put(result.num,0); put("/"); put(result.den,0);
      end if;
    else 
      result := "*"(f1, f2);
      put(f1.num,0); put("/"); put(f1.den,0); 
      put(" * ");
      put(f2.num,0); put("/"); put(f2.den,0);
      put(" = "); 
      if result.num = result.den then 
        put(" 1");
      else
        put(result.num,0); put("/"); put(result.den,0);
      end if;
    end if;
  end printAns;

end hw10;
