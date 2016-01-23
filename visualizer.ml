open Core.Std

(* Define a range operator.
   Call `f' `n' times and return
   a list of the results. *)
let times f n =
  let (--) = List.range in
    List.map ~f:f (0 -- n)

(* Read n bytes from the fifo input channel and
   check if any readings failed (None). If so, return None
   otherwise return all read bytes wrapped in Some. *)
let read_n_bytes fifo n =
  let results = times (fun _ -> In_channel.input_byte fifo) n in
    if List.exists results ((=) None)
    then None
    else Some (List.map ~f:(Option.value ~default: 0) results)

(* Open fifo input channel, call the given function, close the channel,
   return the result. *)
let call_with_fifo fn =
  let fifo = In_channel.create "/tmp/mpd.fifo" ~binary:true in
    let result = fn fifo in
      In_channel.close fifo ;
      result
