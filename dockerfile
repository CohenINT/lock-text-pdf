FROM ubuntu:22.04

 

# Set working directory
WORKDIR /home/app

# Update and install dependencies
RUN apt update -y && \
    apt install -y imagemagick ghostscript poppler-utils mupdf-tools && \
    rm -rf /var/lib/apt/lists/*



# Make the script executable
RUN chmod +x /home/app/convert.sh

# Create the required directories (will be overwritten by volume, but ensures they exist)
RUN mkdir -p /home/app/convertedPdf /home/app/convertedPng /home/app/finilized

# Default command: open a shell (so you can run the script manually)
CMD ["/bin/sh", "-c", "sleep infinity"]