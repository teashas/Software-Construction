with ada.text_IO;
use ada.text_IO;

package hw6 is
type square is (b, BK, BC, RK, RC);
type board is array (1.. 8, 1..8) of square;
  checkerboard: board;
package getSquare is new enumeration_io(square); use getSquare;
procedure getBoard(newBoard: in out board);
procedure printBoard(newBoard: board);
procedure errorMessage(newBoard: in out board);
end hw6;