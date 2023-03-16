FROM mohamedrez/maktaba_base:0.0.2
RUN apt-get install redis -y
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
