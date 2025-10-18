# Repository Guidelines

## Project Structure & Module Organization
The Quarto book that ships this project lives in the repository root. Narrative and TLF chapters sit in `*.qmd`, while rendered HTML/PDF assets land in `_book/`, `pdf/`, and `rtf/`. Shared styling is in `custom.scss` and fonts under `fonts/`. Python utilities are packaged under `src/pycsr`, with notebooks or scripts expected to import from that namespace. The R companion materials reside in `r4csr/`; treat it as a sibling project that mirrors the Quarto structure.

## Build, Test, and Development Commands
Use `uv sync` to create or refresh the local virtual environment defined by `pyproject.toml` and `uv.lock`. Pinning Python for reproducibility uses `uv python pin <version>`, followed by `uv sync`. When dependencies change, run `uv lock --upgrade`, activate the environment, and regenerate the Quarto workflow requirements via `pip-compile --generate-hashes`. Build the book locally with `quarto render` (or `quarto render r4csr` inside the R module) to populate `_book/`. `quarto preview` is helpful for iterative writing.

## Coding Style & Naming Conventions
Python code follows PEP 8: 4-space indentation, lowercase module names, and descriptive snake_case functions. Format and lint before committing with `ruff format src` and `ruff check src`. Maintain sorted imports using `isort` if ruff flags order. Keep Quarto file names lowercase with hyphens, and give code chunk labels snake_case to match the surrounding narrative.

## Testing Guidelines
The repository currently lacks automated tests, so include regression coverage with any substantive Python contribution. Place `pytest` suites under `tests/` with files named `test_*.py`, and ensure they execute with `pytest`. For Quarto content changes, run `quarto check` and visually inspect the rendered outputs for regressions in tables, listings, and figures.

## Commit & Pull Request Guidelines
Commits should be small, focused, and written in the imperative mood (e.g., "update TLF baseline"). Reference related `.qmd` or module paths in the message when practical. Pull requests must highlight the rendered impact (attach `_book` screenshots or describe the section changes), list verification steps (`uv sync`, `quarto render`, `pytest`), and link any tracked issues. Ensure requirements files and lockfiles are regenerated whenever dependencies shift.
