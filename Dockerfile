ARG GO_VERSION=1.20
FROM golang:${GO_VERSION}-bullseye AS builder

WORKDIR /go/src/plugin

COPY . .

RUN make build


FROM fluent/fluent-bit:2.1.8-debug AS base

COPY --from=builder /go/src/plugin/bin/out_gstdout.so /fluent-bit/plugins/
COPY --from=builder /go/src/plugin/etc/ /fluent-bit/etc/
