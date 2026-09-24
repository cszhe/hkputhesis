# hkputhesis

[![Open in Overleaf](https://img.shields.io/badge/Open%20in-Overleaf-47A141?logo=overleaf&logoColor=white)](https://www.overleaf.com/docs?snip_uri=https%3A%2F%2Fgithub.com%2Fcszhe%2Fhkputhesis%2Farchive%2Frefs%2Fheads%2Fmaster.zip&engine=pdflatex)

The unofficial LaTeX class file for PhD/MPhil thesis of the Hong Kong Polytechnic University.

Version 2.0 follows the *Regulations on the Format and Presentation of Thesis for RPg
Degrees* in the [PolyU Research Postgraduate Student Handbook](https://www.polyu.edu.hk/gs/rpghandbook/ref-regulations-format-thesis/).
Always check the latest regulations before submitting.

## Usage

Click **Open in Overleaf** above to start a new Overleaf project from the latest version of this template. If Overleaf cannot find the main file, set it to `main.tex` under **Menu → Main document**.

Compile `main.tex` with `pdflatex` (or `latexmk -pdf main.tex`). The front matter is built
from `abstract.tex`, `publication.tex` (optional), `acknowledgement.tex` and
`abbreviation.tex` (optional); delete an optional file to leave that part out.

Class options:

| Option | Effect |
| --- | --- |
| `phd` (default), `mphil` | Degree shown on the cover and title pages |
| `initial` | Adds "Initial Submission for Examination Purpose" to the cover page. Remove it for the final thesis |
| `onehalfspace` (default), `doublespace` | Line spacing |
| `nolof`, `nolot` | Omit the list of figures / tables |
| `print` | Two-sided layout with a 1.5" binding margin (the default is one-sided, for electronic submission) |
| `10pt`, `11pt`, `12pt` (default) | Font size |

Front matter commands (in the preamble): `\title`, `\author`, `\dept`, `\submitdate`
(month and year of the initial submission), `\awardyear`, `\dedicate`, and
`\partneruniversity` / `\partnerdept` for Dual PhD, and
`\attribution{chapters}{chief supervisor}{previous university}` for transfer-in PhD students.

## Changes in v2.0 (2026)

- Electronic submission: one-sided A4 layout by default; the PDF has all fonts embedded and no security settings.
- New cover page: capitalised title and name, MPhil/PhD, university, year of award, and "Initial Submission for Examination Purpose" (replaces "Temporary Binding for Examination Purposes", option `tempbind` still works).
- Title page reads "partial fulfilment" and supports a Dual PhD partner university and department.
- Optional Statement of Research Attribution and Intellectual Property Clearance for transfer-in PhD students.
- One-and-a-half (or double) line spacing via `setspace`.
- References and publications should be in alphabetical order of the first author, so the sample uses the `plain` bibliography style instead of `unsrt`.
- Acknowledgements must explicitly acknowledge the role of the supervisor(s), including any former supervisor(s).
- The lists of figures, tables and abbreviations are optional.
