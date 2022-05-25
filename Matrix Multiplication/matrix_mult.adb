with ada.text_io, ada.integer_text_io;               
use Ada.Text_IO, ada.integer_text_io;
with hw8;  use hw8;

procedure matrix_mult is
   adim : matrixdim;
   bdim : matrixdim;
begin
  getdim(adim, bdim);
  
  declare 
    m1: matrix(1..adim(1), 1..adim(2));
    m2 : matrix(1..bdim(1), 1..bdim(2));
  begin 
    getelement(m1, m2);
    put(m1 * m2);
  end;
end matrix_mult;