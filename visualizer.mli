(* Read n bytes from the fifo descriptor and
   check if no data was available. If so, return None
   otherwise return all read bytes wrapped in Some. *)
val call_with_fifo : string -> (Unix.file_descr -> 'a) -> 'a
(* Open a FIFO as readonly and non-blocking, execute a function on the descriptor
   and then safely close it again. *)
val read_n_bytes : Unix.file_descr -> int -> int list option
