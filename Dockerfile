FROM ruby:2.7.8-slim

# Set working directory to /app
WORKDIR /app

SHELL ["/bin/bash", "-lc"]

# Set global environment variables
ENV RAILS_ENV=development \
    DATABASE_URL=mysql2://root@mysql:3306/rails_development

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    libyaml-dev \
    libreadline-dev \
    zlib1g-dev \
    libncurses5-dev \
    libffi-dev \
    libgdbm-dev \
    libgdbm-compat-dev \
    libxml2-dev \
    libxslt-dev \
    libpq-dev \
    nodejs \
    npm \
    git \
    curl \
    wget \
    libcurl4-openssl-dev \
    libicu-dev \
    gnupg2 \
    tzdata \
    libmariadb-dev-compat \
    libmariadb-dev

# Copy application code
COPY Gemfile* ./
COPY . .

# Install bundler
RUN bundle install

# Expose port 3000
EXPOSE 3000