# PyClinicalStudyReports - rtflite Demo Book Project

## Project Overview
This is a book project demonstrating how to use rtflite for creating clinical study reports in Python.

## Development Preferences

### Data Science Stack
- **Data Manipulation**: Use `polars` (NOT pandas)
- **Visualization**: Use `plotnine` for ggplot2-style graphics
- **Clinical Tables**: Use `rtflite` for regulatory-compliant table generation

### Code Philosophy
- Write concise and readable analysis code
- Target beginners in the clinical study reporting domain
- Demonstrate concepts clearly with minimal complexity
- Focus on educational value and best practices
- Follow regulatory guidance (ICH E3) for clinical reporting
- Use step-by-step tutorials with clear explanations

### Key Libraries
```python
import polars as pl
import plotnine as ggplot
import rtflite
```

### Project Structure
The project contains example TLF (Tables, Listings, and Figures) notebooks:
- `tlf-ae-specific.qmd` - Adverse Events (Specific)
- `tlf-ae-summary.qmd` - Adverse Events (Summary)
- `tlf-baseline.qmd` - Baseline Characteristics
- `tlf-disposition.qmd` - Patient Disposition
- `tlf-efficacy-ancova.qmd` - Efficacy Analysis (ANCOVA)
- `tlf-population.qmd` - Study Population

## Commands
- **Install dependencies**: `uv add <package>`
- **Sync dependencies**: `uv sync`
- **Render documents**: `quarto render` (renders all .qmd files)
- **Render single file**: `quarto render filename.qmd`
- **Activate environment**: `source .venv/bin/activate` (when needed for Quarto)

## Package Management
- Uses `uv` as the package manager (NOT pip)
- Dependencies declared in `pyproject.toml`
- Exact versions locked in `uv.lock`
- No `requirements.txt` needed

## Important Notes
- Always use polars DataFrames instead of pandas
- Keep examples simple and educational
- Focus on demonstrating rtflite capabilities for clinical reporting
- Ensure code is accessible to domain beginners
- Include regulatory context (ICH E3 guidance) in tutorials
- Use clear step-by-step structure with meaningful section headers
- Add one-sentence summaries at the beginning of each step
- Handle schema compatibility issues (e.g., use `pl.lit(None, dtype=pl.Float64)` for consistent dtypes)

## Tutorial Structure Guidelines
- **Overview**: Explain the regulatory purpose and importance
- **Step-by-step approach**: Clear numbered steps with descriptive titles
- **Educational comments**: Explain the "why" behind operations
- **Error handling**: Use robust approaches that avoid common polars pitfalls
- **Output format**: Generate both RTF (for submission) and PDF (for review)

## Git Policy
- **NEVER commit or push changes automatically**
- Always ask the user before committing changes
- User must explicitly request git operations