with ada.text_io, ada.integer_text_io;               
use ada.Text_IO, ada.integer_text_io;
with hw9;  use hw9;

procedure dates is
  type controlChar is (y, n);
  package useControlChar is new enumeration_io(controlChar); use useControlChar;
  userInput : controlChar;
begin
  put("Enter dates as mmm dd yyyy: ");
  new_line;
  put("Months are Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sept, Oct, Nov, and Dec.");
  new_line;
  put(nextDay(getDate));
  new_line;
  <<start>>
  put("Again? [y/n]: ");
  begin
  get(userInput);
  new_line;
  
  while userInput = y loop
    put(nextDay(getDate)); -- gets a date from the user and then prints the next day's date
    new_line;
    put("Again? [y/n]: ");
    get(userInput);
    new_line;
  end loop;
  
  exception 
    when data_error =>
      skip_line;
      put("  Not a valid control input. ");
      goto start;
  end;
end dates;