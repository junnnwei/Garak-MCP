# Base image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies for uv and builds
RUN apt-get update && apt-get install -y curl build-essential

# Install uv and add it to PATH
RUN curl -Ls https://astral.sh/uv/install.sh | bash && \
    export PATH="/root/.cargo/bin:$PATH" && \
    /root/.cargo/bin/uv pip install --no-cache-dir -r requirements.txt

# Copy your code
COPY . .

# Expose MCP port
EXPOSE 5000

# Set uv binary path explicitly in CMD
CMD ["/root/.cargo/bin/uv", "run", "garak-server"]