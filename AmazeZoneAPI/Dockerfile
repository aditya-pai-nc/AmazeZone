FROM ruby:3.0

# Set the working directory inside the container
WORKDIR /app

# Install essential dependencies
RUN apt-get update -qq && apt-get install -y nodejs sqlite3

# Install bundler
RUN gem install bundler

# Copy the Gemfile and Gemfile.lock into the container and install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the rest of your application code into the container
COPY . .

# Expose port 3000 for the Rails application
EXPOSE 3000