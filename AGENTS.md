# pycsr

## Project structure & module organization

- Quarto book sources live in the repository root, with each chapter authored as a `.qmd`.
- Rendered assets land in `_book/`, `pdf/`, and `rtf/`; keep those directories clean of hand edits.
- Shared styling resides in `custom.scss`, with supporting fonts in `fonts/`.
- Python utilities belong under `src/pycsr`, and downstream scripts should import from that namespace.
- Optional R materials mirror the Python material inside `r4csr/`; treat it as a sibling Quarto project.

## Build, test, and development commands

- Refresh dependencies with `uv sync`, which honors `pyproject.toml` and `uv.lock`.
- Pin Python versions using `uv python pin <version>` followed by `uv sync` to regenerate the environment.
- When dependencies change, run `uv lock --upgrade` to update the lock file, then run `uv sync` to synchronize your environment.
- Build the book with `quarto render --to html` to populate `_book/`.
- Use `quarto preview` for iterative writing and layout checks.

## Coding style & naming conventions

- Follow PEP 8 throughout: 4-space indentation, lowercase module names, and descriptive snake_case functions.
- Run `ruff format src` and `ruff check src` before committing; add `isort .` if ruff flags import ordering.
- Keep Quarto filenames lowercase with hyphens, and use snake_case labels for code chunks to align with the narrative.

## Testing guidelines

- Add regression coverage for any substantive Python contribution, since no automated tests exist yet.
- Place suites under `tests/` using `test_*.py` naming, and verify they run cleanly with `pytest`.
- For Quarto edits, run `quarto check` and manually review rendered tables, listings, and figures for regressions.

## Commit & pull request guidelines

- Keep commits small, focused, and imperative (e.g., "update TLF baseline"), referencing relevant `.qmd` or module paths when helpful.
- In pull requests, summarize rendered impacts (screenshots or descriptions), and list verification steps such as `uv sync`, `quarto render`, and `pytest`.
- Regenerate requirements artifacts whenever dependencies shift so `pyproject.toml` and `uv.lock` stay in sync.

## AI coding tool guidelines

- **Stay within the preferred stack**: Use `polars` for data manipulation, `plotnine` for ggplot-style visualization, and `rtflite` for compliant table generation. Avoid pandas-based shortcuts.
- **Manage dependencies with uv**: Install with `uv add`, sync with `uv sync`, and resist falling back to `pip`; `pyproject.toml` and `uv.lock` remain the single sources of truth.
- **Keep tutorials educational**: Write step-by-step, beginner-friendly code snippets that emphasize ICH E3 context, include one-sentence step summaries, and explain the "why" behind operations.
- **Render and export consistently**: Demonstrate workflows that produce both RTF (submission) and PDF (review) outputs, ensuring schema stability (e.g., explicit dtype handling in polars).
- **Honor git boundaries**: Never commit or push automatically; always wait for explicit user approval before performing any git operation beyond inspection.
