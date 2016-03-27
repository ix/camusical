open Core.Std
open Termbox

let color_intensity n y =
  let fi = float_of_int in
  let screen_percent = ((fi n /. fi y) *. 100.0) in
  if screen_percent < 33.3 then
    Green
  else if screen_percent < 66.6 then
    Yellow
  else
    Red

let plot2 index byte =
  let y = Termbox.height () in
  let byte_capped = (byte mod (y / 3)) in
  for i = 0 to byte_capped do
    Termbox.set_cell_utf8 ~fg:(color_intensity byte_capped (y / 3)) index ((y / 2) + i) @@ Int32.of_int_exn 0x2503
  done

let plot1 index byte =
  let y = Termbox.height () in
  let byte_capped = (byte mod (y / 3)) in
  for i = 0 to byte_capped do
    Termbox.set_cell_utf8 ~fg:(color_intensity byte_capped (y / 3)) index ((y / 2) - i) @@ Int32.of_int_exn 0x2503
  done

let draw fifo width =
  match Visualizer.read_n_bytes fifo (width * 2) with
  | Some data -> List.iteri data ~f:(fun index value ->
      if (index mod 2) = 0 then
        plot1 index value
      else
        plot2 (index - 1) value)
  | None -> ()

let rec visualize fifo =
  match Termbox.peek_event 10 with
  | Some (Ascii 'q') -> ()
  | _ -> Termbox.clear () ; draw fifo (Termbox.width ()) ; Termbox.present () ; visualize fifo

let () =
  Termbox.init () |> ignore ;
  Visualizer.call_with_fifo "/tmp/mpd.fifo" visualize ;
  Termbox.shutdown ()
