# GitHub setup

## Upload correctly

The repository root must directly contain `.github`, `archive_scout`, `docs`, `examples`, `scripts`, `tests`, `README.md`, `requirements-build.txt`, and `run_app.py`. Do not put them inside an extra nested folder.

If using Finder or another file manager, hidden folders may not be visible. Use Git whenever possible:

```bash
cd path/to/archive-scout-linux
git init
git add .
git commit -m "Initial Archive Scout for Linux release"
git branch -M main
git remote add origin https://github.com/YOUR_GITHUB_USERNAME/archive-scout-linux.git
git push -u origin main
```

## Repository settings

Open **Settings → Actions → General**. Select **Allow all actions and reusable workflows**. Under Workflow permissions, select **Read and write permissions**, then save.

## Manual test build

Open **Actions → Build Linux x86_64 App → Run workflow**. Select `main` and run it. After it succeeds, download the artifact named `ArchiveScout-Linux-x86_64` from the workflow summary.

## Publish a release

Create a GitHub release with a tag such as `v1.2.0`, or push that tag from Git. The workflow runs again and uploads:

- `ArchiveScout-Linux-x86_64.tar.gz`
- `ArchiveScout-Linux-x86_64.tar.gz.sha256`

The permanent latest-download link is:

```text
https://github.com/YOUR_GITHUB_USERNAME/archive-scout-linux/releases/latest/download/ArchiveScout-Linux-x86_64.tar.gz
```

Keep the release filename unchanged so the permanent link continues to work.
