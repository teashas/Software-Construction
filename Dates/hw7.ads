with ada.text_IO;
use ada.text_IO;

package hw7 is 
  type month is (jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec);
  type date is
    record 
      dd: integer range 1..31;
      mmm: month;
      yyyy: integer range 0000.. 9999;
  end record;
  package today is new enumeration_io(month); use today;
  function getDate return date;
  function nextDay(dday: date) return date;
  procedure put(dday: date);
end hw7;