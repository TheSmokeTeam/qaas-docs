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

RUN mkdocs build -f _docs/v4/mkdocs.yml -d /app/build

FROM ${HTTP_SERVER_IMAGE}

WORKDIR /app

COPY --from=build /app/build ./

EXPOSE 8080

CMD ["python", "-m", "http.server", "8080", "--directory", "/app"]
