# Run the image in detached mode using the following command:

docker run -it --rm --name rabbitmq -p 5672:5672 -p 15672:15672 rabbitmq:3.12-management

docker container ls

docker container inspect 867c0e76971d  