with ada.text_io; use ada.text_IO;

package hw10 is
  type fraction is private;
  procedure getFraction;
  procedure printAns(f1, f2: fraction);
  
  private 
    
  type fraction is 
    record
      num : integer;
      den : integer;
    end record;
    
    operation : character; 
    f1 : fraction;
    f2 : fraction; 
    function "*"(f1, f2: fraction) return fraction;
    function "+"(f1, f2: fraction) return fraction;
    function simplify(f1: fraction) return fraction;
    function gcd(f1 : fraction) return Integer;
end hw10; 
