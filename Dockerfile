ARG QAAS_DOCS_PYTHON_BASE_IMAGE=python:3.12-slim

FROM ${QAAS_DOCS_PYTHON_BASE_IMAGE} AS build

ARG PIP_INDEX_URL=https://pypi.org/simple
ARG PIP_EXTRA_INDEX_URL=

ENV PIP_INDEX_URL=${PIP_INDEX_URL}
ENV PIP_EXTRA_INDEX_URL=${PIP_EXTRA_INDEX_URL}

WORKDIR /app

COPY requirements.txt ./
RUN python -m pip install --no-cache-dir -r requirements.txt

COPY mkdocs.yml hooks.py README.md ./
COPY docs ./docs
COPY docker/site_server.py ./docker/site_server.py

RUN mkdocs build --clean

FROM ${QAAS_DOCS_PYTHON_BASE_IMAGE} AS runtime

ENV QAAS_DOCS_HOST=0.0.0.0
ENV QAAS_DOCS_PORT=8080

WORKDIR /app

COPY docker/site_server.py /app/site_server.py
COPY --from=build /app/site /app/site

EXPOSE 8080

CMD ["python", "/app/site_server.py"]
