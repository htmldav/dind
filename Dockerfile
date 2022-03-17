FROM maven:3.8.1-adoptopenjdk-11
RUN apt-get update && apt-get install -y openssh-client

COPY .ssh/id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa

RUN echo "Host 130.193.55.125\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config

CMD ["/bin/bash"]

