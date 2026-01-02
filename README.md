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
