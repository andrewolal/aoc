load '~/code/aoc/aoc.ijs'

in =: (< @: (];._1);._2~ (2#LF)&E.) LF,(aoc 2020 6),LF
+/ ([: # ' ' -.~ ~. @: ,) &> in
+/ ([: # ' ' -.~ (e.#[)/) &> in