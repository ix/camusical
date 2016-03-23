val call_with_fifo : string -> (Unix.file_descr -> 'a) -> 'a
val read_n_bytes : Unix.file_descr -> int -> int list option
