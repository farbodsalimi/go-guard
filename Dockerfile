# STEP 1
FROM golang:latest AS builder

WORKDIR /opt
COPY . .

RUN make build-linux

# STEP 2
FROM scratch

COPY --from=builder /opt/bin/go_guard_unix /

CMD ["/go_guard_unix"]
