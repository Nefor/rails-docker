# Use an official Ruby runtime as a parent image
FROM ruby:2.5.1
# Update apt-get in silient mode and install packages with 'yes' for all questions
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
# Create /app folder
RUN mkdir /app
# Set the working directory to /app
WORKDIR /app
# Copy Gemfile into image
COPY Gemfile /app/Gemfile
# Copy Gemfile.lock into image
COPY Gemfile.lock /app/Gemfile.lock
# Install gems in the environment inside container
RUN bundle install
# Recursevly “copy in” files from current dir
COPY . /app
