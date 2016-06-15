# docker-swarm

### Getting started
- Start Vagrant machines
```console
vagrant up
```

- Connect to `swarm-master`
```console
vagrant ssh swarm-master
```

- Point `DOCKER_HOST` to `swarm-master` machine
```console
vagrant@swarm-master:~$ export DOCKER_HOST=tcp://localhost:2375
```

Now you can play with the Swarm cluster - try running some containers, or checkout my [haproxy-consul-template](https://github.com/gnhuy91/haproxy-consul-template) for playing with `HAProxy` and microservices load balancing.
