FROM python:3.13-slim

ENV PYTHONUNBUFFERED=1
ENV PYTHONIOENCODING=utf-8

WORKDIR /app

# Copy in project files explicitly
COPY pyproject.toml uv.lock ./
RUN pip install uv && uv sync --frozen

# Now bring in the actual source code
COPY . .

ENTRYPOINT ["./entrypoint.sh"]
