all:
	ocamlfind ocamlopt -package core -linkpkg -thread -I ocaml-termbox ocaml-termbox/termbox.cmxa visualizer.mli visualizer.ml main.mli main.ml -o main
	rm {*.cmi,*.cmx,*.o}
