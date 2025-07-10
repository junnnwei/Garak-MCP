# Base image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies needed for uv + Python builds
RUN apt-get update && apt-get install -y curl build-essential

# Install uv using official script
RUN curl -Ls https://astral.sh/uv/install.sh | bash

# Add uv to PATH (it installs to ~/.cargo/bin)
ENV PATH="/root/.cargo/bin:$PATH"

# Copy Python dependencies and install them with uv
COPY requirements.txt .
RUN uv pip install --no-cache-dir -r requirements.txt

# Copy the rest of the source code
COPY . .

# Expose MCP default port
EXPOSE 5000

# Start MCP server using uv (same as: python -m garak-server)
CMD ["uv", "run", "garak-server"]