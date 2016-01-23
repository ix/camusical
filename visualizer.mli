(* Simple function to call a function n times and return a list of results. *)
val times : (int -> 'a) -> int -> 'a list

(* Open MPD fifo, pass it to a function, close it and return the result. *)
val call_with_fifo : (in_channel -> 'a) -> 'a

(* Read n bytes from an input channel. If any failed (None) then return None, otherwise
   return a list of all bytes read wrapped in Some. *)
val read_n_bytes : in_channel -> int -> int list option
