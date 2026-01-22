FROM REDA/mkdocs-builder:1.0.0 as build

WORKDIR /app

COPY . .
WORKDIR /app

RUN pip install -i REDA -r requirements.txt

RUN mkdocs build -d ./build

FROM REDA/http-server:1.0.0

WORKDIR /app

COPY --from=build /app/build .

EXPOSE 8080

ENTRYPOINT [ "http-server" ]