# Step 1
FROM rust:1.40 AS builder

WORKDIR /usr/src

# Download the target for static linking.
RUN rustup target add x86_64-unknown-linux-musl

RUN USER=root cargo new rserver
WORKDIR /usr/src/rserver
COPY Cargo.toml Cargo.lock ./
RUN cargo build --release

COPY src ./src
RUN cargo install --target x86_64-unknown-linux-musl --path .

# Step 2
FROM scratch

COPY --from=builder /usr/local/cargo/bin/rserver .

USER 1000

CMD ["./rserver"]
