# anylang-template

[![CI Status](https://github.com/kachick/anylang-template/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/kachick/anylang-template/actions/workflows/ci.yml?query=branch%3Amain+)

A template that is not exclusive to one programming language.\
Provides a basic setup for editors, documents, and GitHub Actions.

## Checklist for new repositories

When using this template for a project, review and update the following files:

- [ ] `README.md` - Update project name, description, and CI badges
- [ ] `Taskfile.yml` - Replace `test` command and add language-specific linters/formatters
- [ ] `flake.nix` - Add required compilers, runtimes, or tools to `devShells`
- [ ] `.gitignore` - Add build outputs and dependency directories
- [ ] `typos.toml` - Clean up unused file exclusions and words
- [ ] `.editorconfig` - Keep only needed language sections or adjust indentation
- [ ] `.vscode/` - Update recommended extensions and settings for your language
- [ ] `.github/renovate.jsonc` - Enable package managers if needed
