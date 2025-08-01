FROM rust:1-alpine as builder

WORKDIR /usr/src/study-container
COPY . .

RUN apk add --no-cache musl-dev
RUN cargo build --release

FROM alpine:latest

WORKDIR /app
COPY --from=builder /usr/src/study-container/target/release/study-container ./server

EXPOSE 3000
CMD ["./server"]
