with ada.text_IO; use ada.text_io;
with ada.integer_text_io; use ada.integer_text_io;

package body hw5 is 
    list : queue;
    num : integer;
    
    
  procedure insertQueue is  
    temp : ptr := new element;
    begin 
      put("  Enter value to be inserted: ");
      get(num);
      new_line(2);
      temp.value := num;
      if list.rear = null then
        list.rear := temp;
      end if;
      if list.front /= null then
        list.front.next := temp;
      end if;
      list.front := temp;
    end insertQueue;
    
    procedure removeQueue is
    temp : ptr := list.rear;
    begin 
      if(list.front = NULL) then
        put("  Cannot remove; the queue is empty.");
        new_line(2);
      else
        num := list.rear.value;
        list.rear := list.rear.next;
        put("  Removed ");
        put(num,0);
        new_line(2);
      end if;
      
      if list.rear = null then
        list.front := null;
      end if;
    end removeQueue;
end hw5;