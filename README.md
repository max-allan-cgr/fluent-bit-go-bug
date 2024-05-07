# fluent-bit-go-bug

Builds and runs with Go:1.22

To "force" the bug to happen, build the image and then run 100 containers. Some of them will fail:
```
docker build -t fluentbit .
for n in `seq 1 100`
do
docker run --name fluent-$n -dt fluentbit
done
```

Give it a few minutes and:
```
docker ps | grep fluent | wc -l
      68
```
So 68 of them failed already.

```
docker ps -a | grep fluent | grep Exit | tail -1 | cut -f1 -d' ' | xargs docker logs | tail -300

```

And you should see some errors after the normal logs end with lots of stacktrace.

