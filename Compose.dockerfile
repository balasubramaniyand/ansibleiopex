version: '3.8'

services:
  web:
    build: .
    ports:
      - "8071:8071"  # Map port 8071 from container to host
    volumes:
      - .:/app  # Optional: Bind-mount current directory for development
    environment:
      - PYTHONUNBUFFERED=1  # Ensures real-time log output
    healthcheck:
      test: ["CMD", "curl", "--fail", "http://localhost:8071/_stcore/health"]
      interval: 30s
      timeout: 10s
      retries: 3
    entrypoint: ["streamlit", "run", "app.py", "--server.port=8071", "--server.address=0.0.0.0"]
