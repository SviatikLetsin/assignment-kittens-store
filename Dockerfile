# Dockerfile

FROM ruby:2.4.9

WORKDIR /assigment-kittens-store
COPY . /assigment-kittens-store
RUN bundle install
RUN bundle exec rake db:create
RUN bundle exec rake db:migrate
RUN bundle exec rake db:seed

EXPOSE 4567

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "4567"]