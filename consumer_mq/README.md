# Create project

```bash
dart create consumer_mq
```

# Run project

```bash
dart run
```

# Build image

```bash
docker build -t consumer_mq .
```

You need to get the IP address of the rabbitmq container and pass it as an environment variable to the consumer_mq container.

```bash
docker inspect rabbitmq
```

# Run image

```bash
docker run -e RABBITMQ_HOST=172.17.0.2 -e RABBITMQ_PORT=5672 --name consumerMQ consumer_mq
```
