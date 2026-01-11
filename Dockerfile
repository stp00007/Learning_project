FROM mcr.microsoft.com/playwright/python:v1.36.0-focal

WORKDIR /app

# Default environment variables (override at runtime)
ENV ORANGE_SRM_URL=https://srm.orange.com
ENV ORANGE_USERNAME=
ENV ORANGE_PASSWORD=

# Use Poetry for dependency management
COPY pyproject.toml /app/
RUN python3 -m pip install --upgrade pip && \
    pip install --no-cache-dir poetry && \
    poetry config virtualenvs.create false && \
    poetry install --no-interaction --no-ansi

# Copy project
COPY . /app

# Ensure Playwright browsers are installed (the base image usually includes them,
# but running install ensures all required browsers/deps are present)
RUN playwright install --with-deps

# Default command runs pytest with -s so test output is printed to stdout
# Added --log-cli-level=DEBUG for debug logs
CMD ["pytest", "-s", "-vv", "--log-cli-level=DEBUG"]