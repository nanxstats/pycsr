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

### Key Libraries
```python
import polars as pl
import plotnine as p9
from rtflite import Rtf
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
- **Run notebooks**: Use Quarto to render .qmd files

## Important Notes
- Always use polars DataFrames instead of pandas
- Keep examples simple and educational
- Focus on demonstrating rtflite capabilities for clinical reporting
- Ensure code is accessible to domain beginners