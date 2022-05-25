with ada.text_io, ada.integer_text_io;               
use ada.Text_IO, ada.integer_text_io; 

package body hw9 is 
    
  function getDate return date is
    dday : date;
    charRead : character;
  begin
      <<start>>
      put("Enter a date as mmm dd, yyyy: ");
      
      begin -- error handling for month
        get(dday.mmm);
        
      exception
        when data_error => 
        put(" Not a legal month, try again");
        skip_line;
        new_line(2);
        goto start;
      end;
      
      declare 
        outOfRange : exception;
      begin  -- error handling for day
        get(dday.dd); 
        case dday.mmm is
          when jan | mar | may | jul | aug | oct | dec =>
            if dday.dd > 31 then
              raise outOfRange;
            end if;
          when apr | jun | sep | nov =>
            if dday.dd > 30 then
              raise outOfRange;
            end if;
          when Feb =>
            if dday.dd > 29 then
              raise outOfRange;
            end if;
        end case; 
              
      exception 
        when data_error => 
          put("  Not a valid day (not a number); try again. ");
          skip_line;
          new_line(2);
          goto start;
        when outOfRange => 
          put("  Never that many days in ");
          put(dday.mmm, 1); 
          put("; try again.");
          skip_line;
          new_line(2);
          goto start;
        when CONSTRAINT_ERROR =>
          put(" No month has that many days; try again.");
          skip_line;
          new_line(2);
          goto start;
      end; 
      
      begin -- error handling for comma
        get(charRead);
        if charRead /= ',' then raise data_error;
        end if;
        
      exception
        when data_error => 
          put(" Expected a comma there between the day and the year; try again.");
          skip_line;
          new_line(2);
          goto start;
      end;
      
      declare 
        notLeapYear : exception;
      begin -- error handling for year
        get(dday.yyyy);
        if dday.mmm = feb then
          if dday.dd > 28 then
            if not leapYear(dday.yyyy) then
              raise notLeapYear;
            end if;
          end if;
        end if;
        
      exception 
        when data_error => 
          put(" Invalid year. Try again.");
          skip_line(2);
          new_line;
          goto start;
        when notLeapYear =>
          put(dday.yyyy, 1);
          put(" is not a leap year; try again.");
          skip_line(2);
          new_line;
          goto start;
      end;  
    return dday;
  end getDate;
  
  function leapYear(yyyy : integer) return boolean is
    begin
      if yyyy mod 400 = 0 then
        return true;
      elsif yyyy mod 100 = 0 then    
        return false;
	    elsif yyyy mod 4 = 0 then
	      return true;
	    else 
	      return false;
     end if; 
  end leapYear;
  
  function nextDay(dday: date) return date is
  tomorrow: date := dday; 
  begin 
    case dday.mmm is
    
-- calculate the next date for the months january, march, may, july, august, and october.
      when jan | mar | may | jul | aug | oct => 
        begin
          case dday.dd is
            when 1..30 =>
              tomorrow.dd := dday.dd + 1;
            when 31 =>
              tomorrow.mmm := month'succ(dday.mmm);
              tomorrow.dd := 1;
            when others =>
              raise constraint_error;
            end case;
            
      exception
        when constraint_error => 
        put("  No month has that many days; try again.");
        skip_line; 
        new_line;    
      end;

-- calculate the next date for the month february (include leap years).       
      when feb =>
          if not leapYear(dday.yyyy) then
            if dday.dd = 28 then 
              tomorrow.mmm := month'succ(dday.mmm);
              tomorrow.dd := 1;
            end if;
          elsif leapYear(dday.yyyy) then 
            if dday.dd = 29 then
              tomorrow.mmm := month'succ(dday.mmm);
              tomorrow.dd := 1;
            else 
              tomorrow.dd := dday.dd + 1;
            end if;
          else 
            tomorrow.dd := dday.dd + 1;
          end if; 
        
-- calculate the next date for the months april, june, september, and november.
      when apr | jun | sep | nov => 
        begin
          case dday.dd is
            when 1..29 =>
              tomorrow.dd := dday.dd + 1;
            when 30 =>
              tomorrow.mmm := month'succ(dday.mmm);
              tomorrow.dd := 1;
            when others =>
              raise constraint_error;
          end case;
          
        exception
          when constraint_error =>
           put("  Never that many days in "); 
           put(dday.mmm,0); 
           put("; try again. ");
           skip_line; 
           new_line; 
        end;
        
-- calculate the next date for the month december.
      when dec => 
        begin
          case dday.dd is
            when 1..30 =>
              tomorrow.dd := dday.dd + 1;
            when 31 =>
              tomorrow.mmm := jan;
              tomorrow.dd := 1;
              tomorrow.yyyy := dday.yyyy + 1;
            when others =>
              raise constraint_error;
          end case;
          
        exception
          when constraint_error => 
          put("  Never that many days in "); 
          put(dday.mmm,0); 
          put("; try again. ");
          skip_line; 
          new_line; 
        end;
      
      
-- raise error when user inputs invalid month.
      when others => 
        put("  Error occured.");
    end case;      
      
-- return the next day.      
    return tomorrow;
  end nextDay;
  
  procedure put(dday: date) is
  begin
    put("  The next day is ");
    put(dday.mmm, 0); put(" ");
    put(dday.dd, 0); put(", ");
    put(dday.yyyy, 0);
  end put; 

end hw9;