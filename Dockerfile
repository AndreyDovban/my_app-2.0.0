FROM registry.astralinux.ru/library/astra/ubi17:1.7.6 

RUN groupadd --gid 1000 andrey
RUN useradd --uid 1000 --gid andrey --shell /bin/bash --create-home andrey

ADD astra_license.orel /etc/astra_license

WORKDIR /opt/my_app
RUN apt update
RUN apt -y dist-upgrade
RUN apt -y install  iputils-ping
RUN apt -y install mc
RUN apt -y install nano
RUN apt -y install firefox
RUN apt -y install systemd
# RUN apt -y install astra-safepolicy
RUN apt -y install astra-freeipa-server
RUN apt -y install sudo
# RUN apt -y install dialog whiptail



# FROM registry.astralinux.ru/library/astra/ubi17:1.7.6 

# RUN groupadd --gid 1000 andrey
# RUN useradd --uid 1000 --gid andrey --shell /bin/bash --create-home andrey

# WORKDIR /opt/my_app

# RUN apt update
# RUN apt -y install mc
# RUN apt -y install firefox


# FROM registry.astralinux.ru/library/astra/ubi17:1.7.6 

# ENV GOBIN=/usr/local/bin

# RUN groupadd --gid 1000 andrey
# RUN useradd --uid 1000 --gid andrey --shell /bin/bash --create-home andrey

# WORKDIR /opt/my_app
# COPY ./go1.23.5.linux-amd64.tar.gz /opt/my_app
# RUN tar --directory=/usr/local -xzf /opt/my_app/go1.23.5.linux-amd64.tar.gz
# RUN ln -s  /usr/local/go/bin/go /usr/local/bin/go
# RUN apt update
# RUN apt -y install mc
# RUN apt -y install gcc
# RUN apt -y install libgl1-mesa-dev
# RUN apt -y install xorg-dev
# RUN apt -y install libxkbcommon-dev
# RUN go install fyne.io/fyne/v2/cmd/fyne@latest


# FROM pasaopasen/redos7.3:latest

# ENV GOBIN=/usr/local/bin

# RUN groupadd --gid 1000 andrey
# RUN useradd --uid 1000 --gid andrey --shell /bin/bash --create-home andrey

# WORKDIR /opt/my_app
# COPY ./go1.23.4.linux-amd64.tar.gz /opt/my_app
# RUN tar --directory=/usr/local -xzf /opt/my_app/go1.23.4.linux-amd64.tar.gz
# RUN ln -s  /usr/local/go/bin/go /usr/local/bin/go
# RUN dnf -y update
# RUN dnf -y install mc
# RUN dnf -y install gcc
# RUN dnf -y install libXi-devel
# RUN dnf -y install libXcursor-devel
# RUN dnf -y install libXrandr-devel
# RUN dnf -y install libXinerama-devel
# RUN dnf -y install libGL-devel
# RUN dnf -y install libXxf86vm-devel
# RUN go install fyne.io/fyne/v2/cmd/fyne@latest
# RUN dnf -y install rpmdevtools rpmlint

# FROM registry.astralinux.ru/library/astra/ubi17:1.7.6 

# ENV GOBIN=/usr/local/bin

# RUN groupadd --gid 1000 andrey
# RUN useradd --uid 1000 --gid andrey --shell /bin/bash --create-home andrey

# WORKDIR /opt/my_app
# COPY ./go1.23.4.linux-amd64.tar.gz /opt/my_app
# RUN tar --directory=/usr/local -xzf /opt/my_app/go1.23.4.linux-amd64.tar.gz
# RUN ln -s  /usr/local/go/bin/go /usr/local/bin/go
# RUN apt update
# RUN apt -y install mc
# RUN apt -y install gcc
# RUN apt -y install libgl1-mesa-dev
# RUN apt -y install xorg-dev
# RUN apt -y install libxkbcommon-dev
# RUN go install fyne.io/fyne/v2/cmd/fyne@latest



### Создание образа для сборки rpm пакета ###

# FROM alt:p10

# ENV GOBIN=/usr/local/bin

# RUN groupadd --gid 1000 andrey
# RUN useradd --uid 1000 --gid andrey --shell /bin/bash --create-home andrey

# WORKDIR /opt/my_app
# COPY ./go1.23.4.linux-amd64.tar.gz /opt/my_app
# RUN tar --directory=/usr/local -xzf /opt/my_app/go1.23.4.linux-amd64.tar.gz
# RUN ln -s  /usr/local/go/bin/go /usr/local/bin/go
# RUN apt-get update
# RUN apt-get -y install mc
# RUN apt-get -y install gcc
# RUN apt-get -y install libXi-devel
# RUN apt-get -y install libXcursor-devel
# RUN apt-get -y install libXrandr-devel
# RUN apt-get -y install libXinerama-devel
# RUN apt-get -y install libGL-devel
# RUN apt-get -y install libXxf86vm-devel
# RUN go install fyne.io/fyne/v2/cmd/fyne@latest
# RUN apt-get -y install rpmdevtools rpmlint

### Команды докера ###

# docker build -t my_alt:p10 .
# docker build -t my_astra:1.7.6 .
# docker build -t freeipa:astra .
# docker build -t my_redos:7.3 .
# docker build -t firefox .
# docker run -it --rm --name app --user andrey my_alt:12 bash
# docker run -it --rm --name app --user andrey my_astra:1.7.6 bash
# docker run -it --rm --name app --user andrey my_redos:7.3 bash
# docker run -it --rm -v $(pwd):/opt/my_app --user=andrey  my_alt:p10 bash 
# docker run -it --rm -v $(pwd):/opt/my_app --env=DISPLAY  --network=host --user=andrey  my_astra:1.7.6 bash 
# docker run -it --rm -v $(pwd):/opt/my_app --env=DISPLAY  --network=host --hostname=astra-domane-test  freeipa:astra bash 
# docker run -it --rm -v $(pwd):/opt/my_app --env=DISPLAY  --network=host --user=andrey  firefox:l firefox 
# docker run -it --rm -v $(pwd):/opt/my_app --user=andrey  my_redos:7.3 bash 

# Astra sysctl config

# kernel.sysrq = 0
# fs.suid_dumpable = 0
# kernel.randomize_va_space = 2
# net.ipv6.conf.all.disable_ipv6 = 1
# net.ipv6.conf.lo.disable_ipv6 = 0

# Примечание - разрешение неавторизованых подключений к "X" серверу
# xhost + 

