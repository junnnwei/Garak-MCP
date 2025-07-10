FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y curl build-essential

# Copy requirements first
COPY requirements.txt .

# Install uv + install Python deps using --system
RUN curl -Ls https://astral.sh/uv/install.sh | bash && \
    /root/.local/bin/uv pip install --system --no-cache-dir -r requirements.txt

# Copy the rest of your app
COPY . .

# Expose default MCP port
EXPOSE 5000

# Start the server using uv
CMD ["/root/.local/bin/uv", "run", "garak-server"]
