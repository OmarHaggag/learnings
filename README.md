# learnings

Concept notes on AI agents, tooling, and related topics. Written in
Markdown (docs/), compiled to PDF from TeX (tex/ -> pdf/).

## Layout

```
learnings/
|-- Makefile
|-- docs/    markdown source notes
|-- tex/     TeX versions for PDF compilation
`-- pdf/     compiled PDFs
```

## Build

- `make` — compile every tex/*.tex into pdf/
- `make release` — compile, then copy the PDFs into ~/docs
- `make clean` — remove TeX build artifacts from pdf/

## Contents

- agent-stack — the script/program/prompt/skill/plugin/agent model:
  what stacks, what contains what, and what actually decides.