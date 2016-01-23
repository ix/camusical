open Core.Std
open Termbox

let graph x value =
  let y = Termbox.height () in
    for i = 0 to (value mod y) do
      Termbox.set_cell_utf8 ~fg:Green x (y - i) @@ Int32.of_int_exn 0x2503
    done

let draw fifo width =
  match Visualizer.read_n_bytes fifo width with
    | Some xs -> List.iteri ~f:(fun index byte -> graph index byte) xs
    | None -> ()

let rec visualize fifo = 
  match Termbox.peek_event 10 with
    | Some (Ascii 'q') -> ()
    | _                -> Termbox.clear () ; draw fifo (Termbox.width ()) ; Termbox.present () ;  visualize fifo

let () =
  Termbox.init () |> ignore ;
  Visualizer.call_with_fifo visualize ;
  Termbox.shutdown ()
