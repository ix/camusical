open Core.Std

let times f n =
  let (--) = List.range in
    List.map ~f:f (0 -- n)

let read_n_bytes fifo n =
  let results = times (fun _ -> In_channel.input_byte fifo) n in
    if List.exists results ((=) None)
    then None
    else Some (List.map ~f:(Option.value ~default: 0) results)

let call_with_fifo fn =
  let fifo = In_channel.create "/tmp/mpd.fifo" ~binary:true in
    let result = fn fifo in
      In_channel.close fifo ;
      result
