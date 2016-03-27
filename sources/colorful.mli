(* Picks a color based upon the percentage of two integers. *)
val color_intensity : int -> int -> Termbox.color
val visualize : Unix.file_descr -> unit
val draw : Unix.file_descr -> int -> unit
(* Plotting functions for two channel audio. *)
val plot1 : int -> int -> unit
val plot2 : int -> int -> unit
