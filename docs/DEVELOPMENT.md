# Development

## Run locally

```bash
python -m pip install -r requirements-runtime.txt
python run_app.py
```

## Run tests

```bash
python -m unittest discover -s tests -v
```

## Compile check

```bash
python -m compileall -q archive_scout run_app.py
```

## Build the release

Install the build dependencies, then run the platform build script:

```bash
python -m pip install -r requirements-build.txt
bash scripts/build_linux.sh
```

The release files appear in `release/`. GitHub Actions runs this build on the correct operating system automatically.

## Add a preset

Edit `archive_scout/defaults.py`. Presets can define targets, keywords, date bounds, CDX filters, collapse values, match type, and advanced parameters.

## Compatibility

Linux x86_64 build for glibc-based desktop distributions comparable to Ubuntu 22.04 or newer. The tarball installs per-user and includes its own Python runtime.
