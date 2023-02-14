FROM ruby:3.1.0
RUN apt-get update -qq && apt-get install -y nodejs
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

RUN gem install foreman
ARG NODE_VERSION=16

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y && \
    curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x | bash - && \
    apt-get install -y nodejs

RUN npm install -g yarn
RUN yarn install --check-files
RUN apt install -y mariadb-client
# Add a script to be executed every time the container starts.

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

# RUN groupadd -r myapp_user && useradd -r -s /bin/false -g myapp_user myapp_user
# WORKDIR /myapp
# RUN mkdir -p /myapp/log
# RUN touch /myapp/log/development.log
# RUN chown -R myapp_user:myapp_user /myapp
# RUN mkdir -p /home/myapp_user/.cache/yarn && chown -R myapp_user:myapp_user /home/myapp_user/.cache/yarn
# RUN mkdir -p /home/myapp_user/.yarn && chown -R myapp_user:myapp_user /home/myapp_user

# USER myapp_user

ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
