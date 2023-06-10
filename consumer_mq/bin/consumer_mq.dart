import "package:dart_amqp/dart_amqp.dart";
import 'dart:io';

void main(List<String> arguments) {
  print('Starting listening queue');
  try {
    listenQueue();
  } catch (e) {
    print('Error: $e');
  }
}

void listenQueue() async {
  final host = Platform.environment['RABBITMQ_HOST'] ?? 'localhost';
  final port =
      int.tryParse(Platform.environment['RABBITMQ_PORT'] ?? '') ?? 5672;

  Client client = Client(
      settings: ConnectionSettings(
    host: host,
    port: port,
  ));

  Channel channel = await client.channel();
  Queue queue = await channel.queue("negarzoncQueue");
  Consumer consumer = await queue.consume();
  consumer.listen((AmqpMessage message) {
    // Get the payload as a string
    print(" [x] Received string: ${message.payloadAsString}");

    // Or unserialize to json
    //print(" [x] Received json: ${message.payloadAsJson}");

    // Or just get the raw data as a Uint8List
    //print(" [x] Received raw: ${message.payload}");

    // The message object contains helper methods for
    // replying, ack-ing and rejecting
    //message.reply("Message recieved");
  });
}
