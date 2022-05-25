
package hw8 is
   type matrix is array (integer range <>, integer range <>) of integer;
   type matrixDim is array (1..2) of integer;
   procedure getdim(m1dim, m2dim : in out matrixdim);
   procedure getelement(m1, m2 : in out matrix);
   function "*"(m1, m2 : matrix) return matrix;
   procedure put(m1 : matrix);
end hw8;