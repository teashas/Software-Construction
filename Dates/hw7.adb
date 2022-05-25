with ada.text_io, ada.integer_text_io;               
use ada.Text_IO, ada.integer_text_io; 

package body hw7 is 
  function getDate return date is
    dday : date;
    charRead : character;
  begin
    put("Enter a date as dd mmm, yyyy: ");
    get(dday.dd);
    get(dday.mmm);
    get(charRead);
    get(dday.yyyy);
    return dday;
  end getDate;
  
  function nextDay(dday: date) return date is
  tomorrow: date := dday; 
  begin 
    case dday.mmm is
-- calculate the next date for the months january, march, may, july, august, and october.
      when jan | mar | may | jul | aug | oct => 
        case dday.dd is
          when 31 =>
            tomorrow.mmm := month'succ(dday.mmm);
              tomorrow.dd := 1;
          when others =>
            tomorrow.dd := dday.dd + 1;
        end case;

-- calculate the next date for the month february (exclude leap years).       
      when feb =>
        case dday.dd is
          when 1..27 =>
            tomorrow.dd := dday.dd + 1;
          when 28 =>
            tomorrow.mmm := month'succ(dday.mmm);
            tomorrow.dd := 1;
          when 29..31 =>
            put("  Day does not exist.");
        end case;
        
-- calculate the next date for the months april, june, september, and november.
      when apr | jun | sep | nov => 
        case dday.dd is
          when 1..29 =>
            tomorrow.dd := dday.dd + 1;
          when 30 =>
            tomorrow.mmm := month'succ(dday.mmm);
            tomorrow.dd := 1;
          when 31 =>
            put("  Day does not exist.");
          end case;
      
-- calculate the next date for the month december.
      when dec => 
        case dday.dd is
          when 1..30 =>
            tomorrow.dd := dday.dd + 1;
          when 31 =>
            tomorrow.dd := 1;
            tomorrow.mmm := jan;
            tomorrow.yyyy := dday.yyyy + 1;
        end case;      
    end case;
      
-- return the next day.      
    return tomorrow;
  end nextDay;
  
  procedure put(dday: date) is
  begin
    put("  The next day is ");
    put(dday.dd, 0); put(" ");
    put(dday.mmm, 0); put(", ");
    put(dday.yyyy, 0);
  end put; 

end hw7;