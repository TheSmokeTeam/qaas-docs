FROM REDA/mkdocs-builder:1.1.0 AS build

WORKDIR /app

RUN git config --global user.name "CI Bot" \
    && git config --global user.email "ci@example.com"

COPY _docs .

# Build the active docs version.
RUN git init \
    && git add . && git commit -m "Initial commit" \
    && mike deploy --config-file v3/mkdocs.yml v3 \
    && mike set-default --config-file v3/mkdocs.yml v3 \
    && git checkout gh-pages \
    && rm -rf .git
# At this point, only the static site files are left in the /app directory

FROM REDA/http-server:1.0.0
WORKDIR /app
COPY --from=build /app .
EXPOSE 8080
ENTRYPOINT [ "http-server" ]
