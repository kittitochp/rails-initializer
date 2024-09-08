# Use an official Ruby runtime as a parent image
FROM ruby:3.3

# Set environment variables
ENV LANG=C.UTF-8 \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs yarn
RUN apt-get update && apt-get install -y gosu && rm -rf /var/lib/apt/lists/*

# Set up the working directory
WORKDIR /app

# Install Rails gem
RUN gem install rails

# Add a script to be executed when the container starts
COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

# Set the entrypoint to the script
ENTRYPOINT ["/usr/bin/entrypoint.sh"]