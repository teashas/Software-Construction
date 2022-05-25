with ada.text_io, ada.integer_text_io;
use ada.text_io, ada.integer_text_io;
with hw7;
use hw7;

procedure dates is 
  controlChar : character;
begin
  put("Enter dates as day month, year.");
  new_line;
  put("Months are Jan, Feb, Mar, Apr, May, June, July, Aug, Sept, Oct, Nov, and Dec.");
  new_line(2);
  put(nextDay(getDate));
  new_line(2);
  put("  Again? [y/n]: ");
  get(controlChar);
  while controlChar = 'y' loop
    put(nextDay(getDate)); -- gets a date from the user and then prints the next day's date
    new_line(2);
    put("  Again? [y/n]: ");
    get(controlChar);
    new_line;
  end loop;

end dates;