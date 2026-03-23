FROM squidfunk/mkdocs-material:9.5

WORKDIR /docs

# Install pinned docs dependencies.
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy docs source and macros hook.
COPY mkdocs.yml .
COPY main.py .
COPY docs/ docs/

# Build site at container startup so QAAS_DOCS_LINK_* runtime env vars are applied.
COPY docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8000

ENTRYPOINT ["/entrypoint.sh"]
