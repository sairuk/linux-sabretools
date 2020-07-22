# SabreTools linux

Some basic install scripts SabreTools on alpine/debian linux

There is an included (basic) docker container

## running it in docker
``` 
$ ./build_image
$ docker run -it  -v <local path>:/home/sabretools sabretools-env
$~ sabretools
```

Note: the official 1.01 release of sabretools threw exceptions whereas
subsequent nightlies were OK


