# Use a slim Python base image
FROM python:3.11-slim

# Set working directory inside the container
WORKDIR /app

# Install system dependencies (for building some Python packages)
RUN apt-get update && apt-get install -y build-essential

# Copy and install dependencies using requirements.txt
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirem  ents.txt

# Copy the rest of the project into the container
COPY . .

# Expose port (adjust if MCP listens on a different port)
EXPOSE 5000

# Change this to the actual entry point if not app.py
CMD ["python", "src/main.py"]