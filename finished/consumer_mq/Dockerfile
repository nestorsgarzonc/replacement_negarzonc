# Use latest stable channel SDK.
FROM dart:stable AS build

# Resolve app dependencies.
WORKDIR /app
COPY pubspec.yaml ./
RUN dart pub get

# Copy app source code (except anything in .dockerignore) and AOT compile app.
COPY . .
RUN dart compile exe bin/consumer_mq.dart -o bin/consumer_mq

# Start server.
EXPOSE 8080
CMD ["/app/bin/consumer_mq"]
