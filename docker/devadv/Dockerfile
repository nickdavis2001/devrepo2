FROM ubuntu:latest

# following line essential or hangs prompting for input when installing
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y 
#    apt-get -y install \
#        python-software-properties \     -  for ppas - posibly ubuntu specific, don't really know what need for now
#        software-properties-common \
#        && \
#    add-apt-repository -y ppa:ultradvorka/ppa && \
#    apt-get update && \
RUN apt-get -y install git \
        apt-transport-https \
        man \
        vim \
        bash-completion \
        curl \
        python-pip \
        python-dev \
        vim-youcompleteme \
        awscli \
        jq \
        ack \
        make \
        neovim \
        wget
#        sshfs \   #potentially very useful, but not going to use yet
#        htop \  # nicer top , don't need yet
#        socat \  # VERY useful debugging tool for use in future, basically socket cat
#        lxc \  # make your own linux containers - may be needed for docker on docker
RUN    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN echo ": syntax on" >> /home/.vimrc \
    && echo "alias h=history" >> /root/.bashrc \
    && echo "set -o vi" >> /root/.bashrc

RUN cd /tmp \
    && wget https://dl.google.com/go/go1.11.linux-amd64.tar.gz \
    && tar -xvf go1.11.linux-amd64.tar.gz \
    && mv go /usr/local 

ENV GOROOT /usr/local/go 
ENV GOPATH $HOME/go 
ENV PATH $GOPATH/bin:$GOROOT/bin:$PATH 

# Change the home directory of the root user to /home
#ENV HOME /home
#ENV USER root
#RUN sed -r -i -e 's@^root:.*@root:x:0:0:root:/home:/bin/bash@' /etc/passwd && \
#    rm -rf /root

# Store the bash history to its own directory so that we can mount a volume
# to that location and have the history preserved across sessions.
#ENV HISTFILE /home/.bash_history/history

#RUN echo 'source ~/.bashrc' >> /home/.bash_profile


# Fuzzy history utility. Seems nicer than hh.
RUN git clone https://github.com/junegunn/fzf.git /home/.fzf \
    && (cd /home/.fzf && git checkout 0.11.1) \
    && (yes | /home/.fzf/install)

# percol: "adds flavor of interactive filtering to the traditional pipe concept of UNIX shell"
# eg: "Useful examples at the command line"
RUN pip install percol==0.2.1 eg==0.1.1 boto3

#ADD https://raw.githubusercontent.com/junegunn/vim-plug/0.8.0/plug.vim \
#    /home/.vim/autoload/plug.vim

# Install vim plugins
#RUN vim -u /home/.vim_plug -c 'PlugInstall|q!|q!' > /dev/null
#RUN vam install youcompleteme
#
#
# docker-engine: "The open-source application container engine"
# docker-compose: "Define and run complex applications using Docker"
# docker-machine: "Machine management for a container-centric world"
RUN curl -sSL https://get.docker.com/ | sh && \
    curl -L https://github.com/docker/compose/releases/download/1.5.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && \
    curl -L https://github.com/docker/machine/releases/download/v0.5.5/docker-machine_linux-amd64 > /usr/local/bin/docker-machine && \
    chmod +x /usr/local/bin/docker*

# Docker-in-docker: https://github.com/jpetazzo/dind
#ADD wrapdocker /usr/local/bin/wrapdocker
#RUN chmod +x /usr/local/bin/wrapdocker
#
#CMD ["wrapdocker"]
#
