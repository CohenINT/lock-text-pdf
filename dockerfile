FROM ubuntu:22.04

# Ensure non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Set working directory
WORKDIR /home/app

# Update and install dependencies
RUN apt update -y && \
    apt install -y imagemagick ghostscript poppler-utils mupdf-tools && \
    rm -rf /var/lib/apt/lists/*

# Copy the conversion script into the container
COPY convert.sh /usr/local/bin/convert.sh

# Make the script executable
RUN chmod +x /usr/local/bin/convert.sh

# Create the required directories (will be overwritten by volume, but ensures they exist)
RUN mkdir -p /home/app/convertedPdf /home/app/convertedPng /home/app/finilized

# Default command: open a shell (so you can run the script manually)
CMD ["/bin/bash"]