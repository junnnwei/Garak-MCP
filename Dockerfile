# Base image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all source code
COPY . .

# MUST expose port 5000 for MCP Toolkit compatibility
EXPOSE 5000

# Start MCP Server
CMD ["uvicorn", "garak_server.main:app", "--host", "0.0.0.0", "--port", "5000"]