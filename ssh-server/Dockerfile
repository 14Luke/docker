FROM ubuntu

RUN apt update && apt install -y openssh-server

RUN useradd -rm -G root -U jenuser

RUN mkdir -p /home/jenuser/.ssh && touch /home/jenuser/.ssh/authorized_keys

COPY ./jenuser.pub /home/jenuser/.ssh

COPY ./JenTest.sh /home/jenuser

COPY ./mysqlbackup.sh /tmp

RUN chmod +x /home/jenuser/JenTest.sh

RUN chmod +x /tmp/mysqlbackup.sh

RUN cat /home/jenuser/.ssh/jenuser.pub >> /home/jenuser/.ssh/authorized_keys && chown -R jenuser:jenuser /home/jenuser/.ssh && chmod -R 700 /home/jenuser/.ssh && chmod 600 /home/jenuser/.ssh/authorized_keys

RUN echo "PasswordAuthentication no" >> /etc/ssh/sshd_config

RUN service ssh start

RUN apt install -y mysql-client

RUN apt install -y awscli

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
