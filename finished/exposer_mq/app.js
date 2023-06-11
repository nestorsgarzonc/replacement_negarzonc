const amqp = require('amqplib/callback_api');

const RABBITMQ_HOST = process.env.RABBITMQ_HOST || 'localhost';
const RABBITMQ_PORT = process.env.RABBITMQ_PORT || 5672;

amqp.connect(`amqp://${RABBITMQ_HOST}:${RABBITMQ_PORT}`, function (err0, connection) {
    if (err0) { throw err0; }

    connection.createChannel(function (err1, channel) {
        if (err1) { throw err1; }
        const queue = 'negarzoncQueue';
        const msg = 'My message';

        channel.assertQueue(queue, {
            durable: false
        });

        channel.sendToQueue(queue, Buffer.from(msg));
        console.log(" [x] Sent %s", msg);
    });
});