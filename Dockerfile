# Use a base image with Perl installed
FROM perl:latest

# Install system dependencies for Perl modules
RUN apt-get update && apt-get install -y \
    libwww-perl \
    liblwp-protocol-https-perl \
    libnet-http-perl \
    && apt-get clean

# Set the working directory to your project
WORKDIR /usr/src/app

# Copy the application code and cpanfile into the container
COPY . .

# Install dependencies specified in cpanfile
RUN cpanm --installdeps .

# Expose the port your application listens on
EXPOSE 80

# Command to run your Perl script
CMD ["perl", "app.pl"]
