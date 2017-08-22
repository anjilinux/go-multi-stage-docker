# gobase layer
FROM golang:alpine AS go-base
ADD . /src
RUN cd /src && go build -o hello

# final layer
FROM alpine
COPY --from=go-base /src/hello /app/
ENTRYPOINT /app/hello