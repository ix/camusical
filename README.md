# camusical
MPD visualizer in OCaml using Termbox.
Unstable, unfinished. Works but not very good yet.

![camusical with green foreground](/img/camusical.png)

# Dependencies
- core
- ocaml-termbox (patched with peek_event, get this library from https://github.com/rein/ocaml-termbox)

# Roadmap
- [X] Write proof of concept visualization.
- [] Create a config file allowing customization of unicode character and color(s).
- [] Multiple visualizations customizable by command line flag.
- [] Find a way to fix the occasional blocking issue from the FIFO.
