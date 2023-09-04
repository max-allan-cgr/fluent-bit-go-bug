.PHONY: build
build:
	CGO_ENABLED=1 \
		go build \
			-buildmode=c-shared \
			-o bin/out_gstdout.so

.PHONY: test
test:
	go test -v -coverprofile=coverage.out -count=1 ./...

.PHONY: clean
clean:
	rm -rf bin/ *.out
