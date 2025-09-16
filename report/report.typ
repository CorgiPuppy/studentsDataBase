#set page(paper: "a4", margin: 2cm)
#set text(font: ("Times New Roman", "Libertinus Serif"), size: 12pt)
#set par(leading: 1.5em, justify: true)

#align(center)[
	#text(weight: "bold", size: 16pt)[ОТЧЁТ]
	#linebreak()
	#text(style: "italic", size: 10pt)[Дата: #datetime.today().display("[day].[month].[year]")]
]
#block(fill: rgb("#f0f0f0"), inset: 8pt, radius: 4pt, stroke: (left: 2pt + blue))[
	#text(weight: "bold")[Студент:] Andrey\
	#text(weight: "bold")[Возраст:] 20\
	#text(weight: "bold")[Специальность:] Chemistry\
	#text(weight: "bold")[Средний балл:] 2\
]
#block(fill: rgb("#f0f0f0"), inset: 8pt, radius: 4pt, stroke: (left: 2pt + blue))[
	#text(weight: "bold")[Студент:] Liza\
	#text(weight: "bold")[Возраст:] 19\
	#text(weight: "bold")[Специальность:] Programming\
	#text(weight: "bold")[Средний балл:] 3\
]
