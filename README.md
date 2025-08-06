# Python for Clinical Study Reports and Submission

Update Python version:

```bash
uv python pin x.y.z
uv sync
```

Update dependencies:

```bash
uv sync
uv lock --upgrade
source .venv/bin/activate
pip-compile --generate-hashes
```

`pip-compile` is part of pip-tools and is used to generate the
`requirements.txt` file used by the Quarto GitHub Actions workflow.
