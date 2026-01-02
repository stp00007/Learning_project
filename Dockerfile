FROM mcr.microsoft.com/playwright/python:v1.36.0-focal

WORKDIR /app

# Install Python deps
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy project
COPY . /app

# Ensure Playwright browsers are installed (the base image usually includes them,
# but running install ensures all required browsers/deps are present)
RUN playwright install --with-deps

# Default command runs pytest with -s so test output is printed to stdout
# Added --log-cli-level=DEBUG for debug logs
CMD ["pytest", "-s", "-vv", "--log-cli-level=DEBUG"]