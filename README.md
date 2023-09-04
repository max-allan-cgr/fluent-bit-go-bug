# fluent-bit-go-bug

This runs correctly:
```console
$ docker build --build-arg="GO_VERSION=1.20" -t fluentbit .; docker run -t fluentbit
```

This fails with `fatal: morestack on g0`:
```console
$ docker build --build-arg="GO_VERSION=1.21" -t fluentbit .; docker run -t fluentbit
```
