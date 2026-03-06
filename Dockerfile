ARG MKDOCS_BUILDER_IMAGE=python:3.12-slim
ARG HTTP_SERVER_IMAGE=python:3.12-slim

FROM ${MKDOCS_BUILDER_IMAGE} AS build

ARG PIP_INDEX_URL
ARG PIP_EXTRA_INDEX_URL

ENV PIP_INDEX_URL=${PIP_INDEX_URL}
ENV PIP_EXTRA_INDEX_URL=${PIP_EXTRA_INDEX_URL}

WORKDIR /app

COPY requirements.txt .
RUN python -m pip install --no-cache-dir -r requirements.txt

COPY . .

RUN mkdocs build -f qaas-docs/_docs/mkdocs.yml -d /app/build/runner
RUN mkdocs build -f qaas.framework-docs/_docs/mkdocs.yml -d /app/build/framework
RUN mkdocs build -f qaas.common.assertions-docs/_docs/mkdocs.yml -d /app/build/assertions
RUN mkdocs build -f qaas.common.generators-docs/_docs/mkdocs.yml -d /app/build/generators
RUN mkdocs build -f qaas.common.probes-docs/_docs/mkdocs.yml -d /app/build/probes
RUN mkdocs build -f qaas.common.processors-docs/_docs/mkdocs.yml -d /app/build/processors
RUN mkdocs build -f qaas-mocker-docs/_docs/mkdocs.yml -d /app/build/mocker
RUN cp suite/index.html /app/build/index.html

FROM ${HTTP_SERVER_IMAGE}

WORKDIR /app

COPY --from=build /app/build/ ./

EXPOSE 8080

CMD ["python", "-m", "http.server", "8080", "--directory", "/app"]
