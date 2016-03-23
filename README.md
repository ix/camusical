# camusical
MPD visualizer in OCaml using Termbox.
Unfinished, but usually works.

![camusical gif with green foreground](/img/camusical.gif)

# Dependencies
- core
- ocaml-termbox (patched with peek_event, get this library from https://github.com/rein/ocaml-termbox)

# Roadmap
- [X] Write proof of concept visualization.
- [ ] Create a config file allowing customization of unicode character and color(s).
- [ ] Multiple visualizations customizable by command line flag.
- [X] Find a way to fix the occasional blocking issue from the FIFO.
