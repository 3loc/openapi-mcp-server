# server.py
import os
from starlette.applications import Starlette
from starlette.routing import Mount, Host
from mcp.server.fastmcp import FastMCP

# Create an MCP server
mcp = FastMCP("openapi_mcp_server")

# Add an addition tool
@mcp.tool()
def add(a: int, b: int) -> int:
    """Add two numbers"""
    return a + b


# Add a dynamic greeting resource
@mcp.resource("greeting://{name}")
def get_greeting(name: str) -> str:
    """Get a personalized greeting"""
    return f"Hello, {name}!"


# If see mode, mount the SSE server to the existing ASGI server
if os.getenv("MODE") == "sse":
    app = Starlette(
        routes=[
            Mount('/', app=mcp.sse_app()),
        ]
    )
