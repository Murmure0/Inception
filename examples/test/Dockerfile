FROM alpine:latest

RUN apk update && \
    apk add vim

RUN adduser -S test_user

COPY testfile testfile

RUN mkdir -p /data/hostvolume
RUN echo "Persistent data!" > /data/hostvolume/data_from_container
VOLUME /datamb/hostvolume

EXPOSE 80