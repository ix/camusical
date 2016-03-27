open Core.Std

let read_n_bytes fifo size =
  let buf = String.create size in
  match Unix.read fifo ~buf:buf with
  | exception Unix.Unix_error (_, _, _) -> None
  | n -> Some (List.map ~f:int_of_char @@ String.to_list @@ String.sub ~len:n ~pos:0 buf)

let call_with_fifo filename fn =
  let fifo = Unix.openfile ~mode:[Unix.O_RDONLY; Unix.O_NONBLOCK] filename in
  let result = fn fifo in
  Unix.close fifo ;
  result
