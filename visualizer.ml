open Core.Std

(* Read n bytes from the fifo descriptor and
   check if any readings failed (None). If so, return None
   otherwise return all read bytes wrapped in Some. *)
let read_n_bytes fifo size =
  let buf = String.create size in
  match Unix.read fifo ~buf:buf with
  | exception Unix.Unix_error (_, _, _) -> None
  | n -> Some (List.map ~f:int_of_char @@ String.to_list @@ String.sub ~len:n ~pos:0 buf)


(* Open a FIFO as readonly and non-blocking, execute a function on the descriptor
   and then safely close it again. *)
let call_with_fifo filename fn =
  let fifo = Unix.openfile ~mode:[Unix.O_RDONLY; Unix.O_NONBLOCK] filename in
    let result = fn fifo in
      Unix.close fifo ;
      result
