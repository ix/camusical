all:
	mkdir -p visualizers
	for i in `ls sources/*.ml` ; do \
		filename=`basename -s .ml $$i` ; \
		ocamlfind ocamlopt \
			-linkpkg \
			-thread \
			-package core \
			-I ocaml-termbox ocaml-termbox/termbox.cmxa \-I sources \
			-I sources \
      visualizer.mli visualizer.ml sources/$$filename.mli sources/$$filename.ml \
			-o visualizers/$$filename ; \
	done

	rm *.cmi ; rm *.cmx ; rm *.o
