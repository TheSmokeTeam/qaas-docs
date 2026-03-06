FROM REDA/mkdocs/mkdocs-builder:1.1.0 AS build

WORKDIR /app

RUN git config --global user.name "CI Bot" \
    && git config --global user.email "ci@example.com"

COPY _docs .

# Build the active docs version.
# Mike uses a git repo and commits to the gh-pages branch to control versioning,
# so temporarily initialize a git repo.
RUN git init \
    && git add . && git commit -m "Initial commit" \
    && mike deploy --config-file v4/mkdocs.yml v4 \
    && mike set-default --config-file v4/mkdocs.yml v4 \
    && git checkout gh-pages \
    && rm -rf .git
# At this point, only the static site files are left in the /app directory

FROM REDA/http-server:1.0.0
WORKDIR /app
COPY --from=build /app .
EXPOSE 8080
ENTRYPOINT [ "http-server" ]
