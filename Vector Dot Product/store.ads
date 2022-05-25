package store is
type vector is array(1..3) of float;
procedure get(firstVector: out vector);
function "*"(firstVector: vector; secondVector: vector) return float;
end store;