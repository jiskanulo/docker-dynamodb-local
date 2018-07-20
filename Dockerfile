FROM openjdk:alpine

LABEL maintainer "yusuke.mori <jiska.ym@gmail.com>"

RUN mkdir /usr/local/dynamodb
WORKDIR /usr/local/dynamodb

RUN wget https://s3-ap-northeast-1.amazonaws.com/dynamodb-local-tokyo/dynamodb_local_latest.tar.gz && \
    tar -xf dynamodb_local_latest.tar.gz

ENTRYPOINT ["java", "-Djava.library.path=./DynamoDBLocal_lib", "-jar", "DynamoDBLocal.jar", "-sharedDb"]
