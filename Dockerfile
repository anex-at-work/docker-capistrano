FROM adgud2/ruby-rvm:latest

RUN /usr/local/rvm/scripts/rvm install ruby-2.3.2@capistrano --create &&\
    /usr/local/rvm/scripts/rvm --default use ruby-2.3.2@capistrano &&\
    /usr/local/rvm/gems/ruby-2.3.2/wrappers/gem update --system &&\
    /usr/local/rvm/gems/ruby-2.3.2/wrappers/gem install capistrano -v 3.8.0 &&\
    which ssh-agent || ( apt-get update -y && apt-get install openssh-client -y ) &&\
    eval $(ssh-agent -s) &&\
    mkdir -p ~/.ssh &&\
    apt-get -y install npm

RUN ln -s /usr/local/bin/node /usr/bin/node &&\
    ln -s /usr/local/bin/npm /usr/bin/npm

ENTRYPOINT /bin/bash -l
