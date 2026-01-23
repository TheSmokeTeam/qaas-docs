FROM python:3.11-slim

WORKDIR /docs

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy documentation
COPY mkdocs.yml .
COPY docs/ docs/

# Expose port
EXPOSE 8000

# Serve documentation
CMD ["mkdocs", "serve", "--dev-addr=0.0.0.0:8000"]
