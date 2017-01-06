FROM adgud2/ruby-rvm:latest

RUN /usr/local/rvm/scripts/rvm install ruby-2.3.2@capistrano --create &&\
    /usr/local/rvm/scripts/rvm --default use ruby-2.3.2@capistrano &&\
    /bin/bash -lc 'gem update --system && gem install capistrano -v 3.7.1' &&\
    which ssh-agent || ( apt-get update -y && apt-get install openssh-client -y )  &&\
    eval $(ssh-agent -s) &&\
    mkdir -p ~/.ssh
