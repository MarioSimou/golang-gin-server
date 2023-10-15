FROM golang:1.21-alpine as build

WORKDIR /app
COPY . .

RUN go get ./... \
    && go build -o /go/bin/server ./cmd/main.go

FROM gcr.io/distroless/base

WORKDIR /go/bin
COPY --from=build /go/bin/server ./server

EXPOSE 8080
CMD ["./server"]