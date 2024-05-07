FROM chainguard/go AS builder

WORKDIR /go/src/plugin

COPY . .

RUN make build


FROM cgr.dev/chainguard/newrelic-fluent-bit-output 

COPY --from=builder /go/src/plugin/bin/out_gstdout.so /fluent-bit/plugins/
COPY --from=builder /go/src/plugin/etc/ /fluent-bit/etc/
