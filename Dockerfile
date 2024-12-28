FROM alt:p10

WORKDIR /opt/app
COPY ./go1.23.4.linux-amd64.tar.gz /opt/app
RUN tar --directory=/usr/local -xzf /opt/app/go1.23.4.linux-amd64.tar.gz
RUN ln -s  /usr/local/go/bin/go /usr/local/bin/go
RUN apt-get update
RUN apt-get -y install mc
RUN apt-get -y install gcc
RUN apt-get -y install libXi-devel
RUN apt-get -y install libXcursor-devel
RUN apt-get -y install libXrandr-devel
RUN apt-get -y install libXinerama-devel
RUN apt-get -y install libGL-devel
RUN apt-get -y install libXxf86vm-devel
RUN go install fyne.io/fyne/v2/cmd/fyne@latest
RUN ln -s  /root/go/bin/fyne /usr/local/bin/fyne
RUN apt-get -y install rpmdevtools rpmlint


# docker build -t my_alt:12 .
# docker run -it --rm my_alt:12 bash

# sudo apt -y install gcc
# sudo apt -y install libXi-devel
# sudo apt -y install libXcursor-devel
# sudo apt -y install libXrandr-devel
# sudo apt -y install libXinerama-devel
# sudo apt -y install libGL-devel
# sudo apt -y install libXxf86vm-devel