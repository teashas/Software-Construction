with ada.text_io, ada.integer_text_io;               
use Ada.Text_IO, ada.integer_text_io;

package body hw8 is
  procedure getdim(m1dim, m2dim : in out matrixdim) is 
     charRead : character;
    begin
      put("Matrix dimensions are to be entered as NxM.");
      new_line(2);
      put("  Enter dimensions of the first matrix: ");
      get(m1dim(1)); get(charRead); get(m1dim(2));
      new_line;
      put("  Enter dimensions of the second matrix: ");
      get(m2dim(1)); get(charRead); get(m2dim(2));
      new_line; 
  end getdim;
  
  procedure getelement(m1, m2 : in out matrix) is 
  begin
    put("  Enter values for the first matrix (");
    put(m1'length(1),0); put("x"); put(m1'length(2),0);  put(") : ");
    new_line(2);
    for row1 in m1'range(1) loop 
      for col1 in m1'range(2) loop
        put("     Value of element(");
        put(row1, 0); put("x"); put(col1,0); put(")? ");
        get(m1(row1,col1));
        new_line;
      end loop;
    end loop;
    
    put("  Enter values for the second matrix (");
    put(m2'length(1),0); put("x"); put(m2'length(2),0); put(") : ");
    new_line(2);
    for row2 in m2'range(1) loop 
      for col2 in m2'range(2) loop
        put("     Value of element(");
        put(row2, 0); put("x"); put(col2,0); put(")? ");
        get(m2(row2,col2));
        new_line;
      end loop;
    end loop;
  end getelement;

   function "*"(m1, m2 : matrix) return matrix is
      result : matrix(m1'range(1), m2'range(2)) := (others => (others =>0));
   begin
      for row in m1'range(1) loop
         for col2 in m2'range(2) loop
            for col1 in m1'range(2) loop
               result(row,col2) := result(row,col2) + (m1(row, col1)* m2(col1, col2));
            end loop;
         end loop;
      end loop;
      return result;
   end "*";
   
   procedure put(m1 : matrix) is
   begin
     put("  Their product is the following ");
     put(m1'length(1),0); put("x"); put(m1'length(2),0); put(" matrix:");
     new_line(2);
      for row in m1'range (1) loop
         for col in m1'range (2) loop
            put(m1(row, col));
         end loop;
         new_line;
      end loop;
   end put;
   
end hw8;
