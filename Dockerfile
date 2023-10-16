FROM golang:1.21-alpine as build

ARG SHORT_SHA

WORKDIR /app
COPY . .

RUN go get ./... \
    && go build -o /go/bin/server ./cmd/main.go

FROM gcr.io/distroless/base

WORKDIR /go/bin
ARG SHORT_SHA
ENV SHORT_SHA=${SHORT_SHA}
ENV GIN_MODE=release

COPY --from=build /go/bin/server ./server

EXPOSE 8080
CMD ["./server"]