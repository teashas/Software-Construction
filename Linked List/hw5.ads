package hw5 is
    type element;
    type ptr is access element;
    procedure insertQueue;
    procedure removeQueue;
    
    type queue is record
       front : ptr := null;
       rear : ptr := null;
    end record;
    type element is record
      value : integer;
      next : ptr := null;
    end record;
    
end hw5;