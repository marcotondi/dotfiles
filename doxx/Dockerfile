FROM rust:latest AS builder
WORKDIR /usr/src/doxx
RUN apt-get update && apt-get install -y libssl-dev pkg-config
RUN cargo install doxx

FROM debian:stable-slim
COPY --from=builder /usr/local/cargo/bin/doxx /usr/local/bin/doxx
RUN apt-get update && apt-get install -y libssl-dev pkg-config
ENTRYPOINT ["doxx"]