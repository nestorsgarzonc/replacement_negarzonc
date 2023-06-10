# Create project using:

```bash
npm init --y
```

# Run in your host using

```bash
node ./app.js
```

# Build image

```bash
docker build -t exposer_mq .
```

You need to get the IP address of the rabbitmq container and pass it as an environment variable to the exposer_mq container.

```bash
docker inspect rabbitmq
```

# Run image

```bash
docker run -e RABBITMQ_HOST=172.17.0.2 -e RABBITMQ_PORT=5672 --name exposerMQ exposer_mq
```
