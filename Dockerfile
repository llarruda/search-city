FROM ruby:2.7.0
LABEL author="leandroarruda1977@gmail.com"

ARG USER_ID
ARG GROUP_ID

RUN addgroup --gid $GROUP_ID user
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID user

ENV INSTALL_PATH /opt/app
RUN mkdir -p $INSTALL_PATH

# NodeJS Environment
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg -o /root/yarn-pubkey.gpg && apt-key add /root/yarn-pubkey.gpg
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y nodejs yarn

# Rails Enviroment
RUN gem install rails bundler

COPY Gemfile Gemfile
WORKDIR /opt/app/search-city
RUN bundle install

# env
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y locales

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LC_ALL C.UTF-8

RUN chown -R user:user /opt/app
USER $USER_ID
VOLUME ["$INSTALL_PATH/public"]
ENV RUBYOPT='-W:no-deprecated -W:no-experimental'
CMD RUBYOPT='-W:no-deprecated -W:no-experimental' bundle exec unicorn -c config/unicorn.rb