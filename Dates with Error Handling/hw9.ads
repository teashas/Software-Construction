with ada.text_io; use ada.text_IO;

package hw9 is
  type month is (jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec);
  type date is
    record 
      mmm: month;
      dd: integer range 1..31;
      yyyy: integer range 1000.. 9999;
  end record;
  package today is new enumeration_io(month); use today;
  function getDate return date;
  function nextDay(dday: date) return date;
  procedure put(dday: date);
  function leapYear(yyyy: integer) return boolean;
end hw9;
