FROM debian:bookworm

RUN apt-get update && apt-get install -y hexchat
RUN useradd -m user
USER user
CMD ["hexchat"]
