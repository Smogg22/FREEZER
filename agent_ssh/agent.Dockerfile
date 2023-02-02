FROM archlinux




# Installation des paquets necessaires

RUN pacman -Sy \
&& pacman -S --noconfirm git jdk11-openjdk openssh python \
&& useradd jenkins -m \
&& mkdir /home/jenkins/.ssh

# envoie de la cle publique

COPY jenkins_rsa.pub /home/jenkins/.ssh/authorized_keys

RUN ssh-keygen -A \
&& mkdir -p /run/sshd

# on lance le serveur SSH

CMD /usr/bin/sshd -D



