# OpenAPI MCP Server

This is a skeleton project that you can use as a starting point for building your own MCP server. The example addition function demonstrates how to implement handlers across all three protocols.

## Features

Current implementation status:
- ✅ Standard I/O (stdio)
- ✅ Server-Sent Events (SSE)
- ✅ OpenAPI/REST endpoints

## Running Modes

The server supports three different modes of operation, controlled by the `MODE` environment variable:

- `stdio`: Run as a standard I/O server
- `sse`: Run as a Server-Sent Events server (port 8001)
- `openapi`: Run as an OpenAPI/REST server (port 8002)

## Building and Running

### Using Docker Compose

1. Build the container:
```bash
docker compose build
```

2. Run specific services:
```bash
# Run all services
docker compose up

# Run only SSE server
docker compose up sse-mcp-server

# Run only OpenAPI server
docker compose up openapi-mcp-server
```

### Using Docker directly

You can also run the server directly using Docker:

```bash
# Run in stdio mode
docker run -i --rm -e MODE=stdio 3loc/openapi-mcp-server

# Run in SSE mode
docker run -p 8001:8000 --rm -e MODE=sse 3loc/openapi-mcp-server

# Run in OpenAPI mode
docker run -p 8002:8000 --rm -e MODE=openapi 3loc/openapi-mcp-server
```

## Configuration

The server can be configured using an `mcp.json` file. Here's an example configuration:

```json
{
  "mcpServers": {
    "stdio-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "--rm", 
        "-i",
        "--name", "openapi-mcp-server",
        "-e", "MODE=stdio",
        "3loc/openapi-mcp-server"
      ]
    },
    "sse-mcp-server": {
      "url": "http://localhost:8001/sse"
    }
  }
}
```

## Development

The project provides a foundation for implementing an MCP server with multiple communication protocols. All three modes (stdio, SSE, and OpenAPI) are now implemented and can be used interchangeably based on your needs.

