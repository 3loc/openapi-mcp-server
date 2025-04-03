# OpenAPI MCP Server

This is a skeleton project that you can use as a starting point for building your own MCP server. The example addition function demonstrates how to implement handlers across all three protocols.

## Features

Current implementation status:
- ✅ Standard I/O (stdio)
- ⬜ Server-Sent Events (SSE)
- ⬜ OpenAPI/REST endpoints

## Building and Running

### Using Docker Compose

1. Build the container:
```bash
docker compose build
```

2. Run the server:
```bash
docker compose up
```

## Configuration

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

### Configuration Explanation

- `mcpServers`: Object containing server configurations
- `openapi-mcp-server`: Server identifier
  - `command`: The command to run the server (in this case using Docker)
  - `args`: Array of arguments passed to the command
    - `--rm`: Remove container when it exits
    - `-i`: Keep STDIN open for stdio communication
    - `--name`: Specify container name
    - Last argument specifies the Docker image to use

## Development

The project provides a foundation for implementing an MCP server with multiple communication protocols. Currently, only the stdio implementation is complete, with SSE and OpenAPI endpoints planned for future implementation.

