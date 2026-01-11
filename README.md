Hello world
Shubham

---

## Run tests in Docker ✅

This project includes a `Dockerfile` and `docker-compose.yml` to run the test suite inside a Playwright-enabled container.

Build the image:

```sh
docker build -t learning_project:latest .
```

Run tests in a container (mounts the current directory so changes persist):

```sh
docker run --rm -it -v "$(pwd)":/app -w /app learning_project:latest pytest -s
```

Or run with `docker-compose`:

```sh
docker-compose run --rm tests
```

Notes:

- The image is based on the official Playwright Python image which includes browser dependencies.
- If Chromium shows shared-memory issues, increase memory with `--shm-size=1g` or set `shm_size: '1gb'` in `docker-compose.yml`.
- You can override the default command when running the container if needed.

---

## Orange SRM Login test ✅

This repository now includes an end-to-end test that validates logging in to an Orange SRM instance.

Required environment variables (set locally or pass to Docker):

- `ORANGE_SRM_URL` — URL of the Orange SRM instance (default: `https://srm.orange.com`)
- `ORANGE_USERNAME` — username to use for the login test
- `ORANGE_PASSWORD` — password to use for the login test

Run the login test locally:

```sh
export ORANGE_SRM_URL="https://your-srm.example.com"
export ORANGE_USERNAME="your_user"
export ORANGE_PASSWORD="your_pass"
pytest -k "Login" -q
```

Run in Docker (pass env vars):

```sh
docker run --rm -it \
  -e ORANGE_SRM_URL -e ORANGE_USERNAME -e ORANGE_PASSWORD \
  -v "$(pwd)":/app -w /app learning_project:latest pytest -k "Login" -q
```

If the page uses non-standard selectors for username/password or the login button, update the selectors in `steps/test_search_steps.py`.

---

## Poetry support ✅

This project now uses Poetry for dependency management. To install dependencies locally:

```sh
pip install poetry
poetry install
```

Run tests with Poetry:

```sh
poetry run pytest -q
```

If you still need `requirements.txt` for other tooling, generate it from Poetry:

```sh
poetry export -f requirements.txt --output requirements.txt --without-hashes
```
