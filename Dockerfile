FROM maven:3.8.1-adoptopenjdk-11
RUN apt-get update && apt-get install -y openssh-client
RUN useradd -m user
RUN mkdir -p /home/user/.ssh
COPY id_rsa_shared /home/user/.ssh/id_rsa
RUN chown -R user:user /home/user/.ssh
RUN echo "Host 84.252.137.230\n\tStrictHostKeyChecking no\n" >> /home/user/.ssh/config
USER user
CMD ["/bin/bash"]