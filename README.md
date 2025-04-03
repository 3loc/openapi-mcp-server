# OpenAPI MCP Server

This is a skeleton project that you can use as a starting point for building your own MCP server. The example addition function demonstrates how to implement handlers across all three protocols.

## Features
[X] - Standard I/O (stdio)
[ ] - Server-Sent Events (SSE)
[ ] - OpenAPI/REST endpoints

## Building and Running

### Using Docker Compose

1. Build the container:
```bash
docker compose build
```

### Configuration

The server can be configured using an `mcp.json` file. Here's an example configuration:

```json
{
  "mcpServers": {
    "openapi-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "--rm", 
        "-i",
        "--name", "openapi-mcp-server",
        "3loc/openapi-mcp-server"
      ]
    }
  }
}
```


## Development

