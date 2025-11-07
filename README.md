# Python for Clinical Study Reports and Submission

The book is available at <https://pycsr.org/>.

This project is a work in progress, enriched by the community's collective efforts.
As you read this book, consider joining us as a contributor.
The quality of this resource relies heavily on your input and expertise.
We value your participation and contribution.

- Authors: contributed the majority of content to at least one chapter.
- Contributors: contributed at least one commit to the source code.
- [List of authors and contributors](https://pycsr.org/preface.html#authors-and-contributors)

## Codespaces 

To explore code in this book, use the "Open in GitHub Codespaces" button below.

[![](https://github.com/codespaces/badge.svg)](https://codespaces.new/nanxstats/pycsr?quickstart=1&devcontainer_path=.devcontainer%2Fdevcontainer.json)

## Installing dependency 

### Update Python version:

```bash
uv python pin x.y.z
uv sync
```

### Update dependencies:

```bash
uv lock --upgrade
uv sync
```

### Build the book

```bash 
quarto render
```
