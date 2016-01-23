val times : (int -> 'a) -> int -> 'a list
val call_with_fifo : (in_channel -> 'a) -> 'a
val read_n_bytes : in_channel -> int -> int list option
