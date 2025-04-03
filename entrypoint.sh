#!/usr/bin/env bash

# Get the mode from environment variable, default to openapi if not set
MODE=${MODE:-openapi}

case "$MODE" in
  "stdio")
    uv run mcp run openapi_mcp_server/src/server.py
    ;;
  "sse")
    # Run with uvicorn for SSE mode since it needs to serve HTTP
    uv run uvicorn openapi_mcp_server.src.server:app --host 0.0.0.0 --port 8000
    ;;
  "openapi")
    uv run mcp run openapi_mcp_server/src/server.py
    ;;
  *)
    echo "Error: Invalid MODE. Must be one of: stdio, sse, openapi"
    exit 1
    ;;
esac
